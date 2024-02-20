from django.db.models import Q
from django.conf import settings
from django.contrib import auth
from django.http import HttpResponse, JsonResponse
from django.core.mail import EmailMessage
from django.core.paginator import Paginator
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.shortcuts import render, redirect
from django.template.loader import render_to_string

# import DB tables
from webapp.models import handrail
from webapp.models import defectType
from webapp.models import defect
from webapp.models import defectTypeThreshold


# python bulit-in modules
import os
import csv
import json
import base64
from datetime import datetime

from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def login(request):

    if request.user.is_authenticated:
        return redirect('../logs/')
    
    username = request.POST.get('username', '')
    password = request.POST.get('password', '')

    user = auth.authenticate(username=username, password=password)

    if user is not None and user.is_active:
        auth.login(request, user)
        request.session['user'] = username
        return redirect('../logs/')
    else:
        return render(request, 'login.html', {'error': 'Usernamme or password not correct!'})

@login_required(login_url="/")
def mylogout(request):
    logout(request)
    return redirect('/')


@csrf_exempt
@login_required(login_url="/")
def logs(request):

    currentUser = request.user
    currentUserName = currentUser.username
       
    # for rendering berth list to dropdown list in template
    lineList = handrail.objects.values_list('sLine', flat=True).distinct().order_by('sLine')
    defectTypeList = defectType.objects.values_list('sDefectTypeName', flat=True).distinct().order_by('sDefectTypeName')

    # show lines and stations in drop-down list
    if 'escNo' in request.POST:
        selected_line = request.POST.get('line')
        selected_station = request.POST.get('station')
        selected_escNo = request.POST.get('escNo')
        positionList = handrail.objects.filter(sLine=selected_line, sStation=selected_station, sEscNo=selected_escNo).values('sHandrailID','sPosition').distinct().order_by('sPosition')
        return JsonResponse(list(positionList), safe=False)
    elif 'station' in request.POST:
        selected_line = request.POST.get('line')
        selected_station = request.POST.get('station')
        escList = handrail.objects.filter(sLine=selected_line, sStation=selected_station).values('sHandrailID','sEscNo').distinct().order_by('sEscNo')
        return JsonResponse(list(escList), safe=False)
    elif 'line' in request.POST:
        selected_line = request.POST.get('line')
        stationList = handrail.objects.filter(sLine=selected_line).distinct().values('sHandrailID','sStation').order_by('sStation')
        return JsonResponse(list(stationList), safe=False)
    
    # Search box 
    if request.GET.get("name",):

        keyWord = request.GET.get("name",)
        selectedDefectList = (defect.objects.filter(
                                                    Q(sDefectTimeStamp__icontains=keyWord) | 
                                                    Q(sLength__icontains=keyWord) | 
                                                    Q(sWidth__icontains=keyWord) | 
                                                    Q(sDepth__icontains=keyWord) | 
                                                    Q(sDistanceFromStartPoint__icontains=keyWord) | 
                                                    Q(sSpeed__icontains=keyWord) | 
                                                    Q(sSeverity__icontains=keyWord) |
                                                    Q(sDefectHandrailID__sLine__icontains=keyWord) |
                                                    Q(sDefectHandrailID__sStation__icontains=keyWord) |
                                                    Q(sDefectHandrailID__sEscNo__icontains=keyWord) |
                                                    Q(sDefectHandrailID__sPosition__icontains=keyWord) |
                                                    Q(sDefectDefectTypeID__sDefectTypeName__icontains=keyWord)                                      
                                                    )).order_by('sSeverity', '-sDefectTimeStamp')[:200]    
        
        
        
        # pagination
        current_page = int(request.GET.get('page_num', 1)) 
        paginator = Paginator(selectedDefectList, 12)
    
        if paginator.num_pages > 11:
            if current_page - 5 < 1:
                page_range = range(1, 12)
            elif current_page + 5 > paginator.num_pages:
                page_range = range(paginator.num_pages - 10, paginator.num_pages + 1)
            else:
                page_range = range(current_page - 5, current_page + 5)
        else:
            page_range = paginator.page_range
        try:
            page = paginator.page(current_page)
        except Exception as E:
            current_page = 1 
            page = paginator.page(current_page)

        return render(request, 'logs.html', locals())

    elif 'search' in request.GET:
        selectedLine = request.GET.get('selectedLine',)
        selectedStation = request.GET.get('selectedStation',)
        selectedEscalatorNo = request.GET.get('selectedEscalatorNo',)
        selectedPosition = request.GET.get('selectedPosition',)
        selectedDefectType = request.GET.get('selectedDefectType',)
        dateRange = request.GET.get('dateRange', "2023-01-01 to 2024-06-21")
        startDate = dateRange[:10]          
        endDate = dateRange[-10:]

        selectedDefectList = []

        try:
            if selectedLine and selectedStation and selectedEscalatorNo and selectedPosition and selectedDefectType:
                selectedHandrail = handrail.objects.filter(sLine=selectedLine, sStation=selectedStation, sEscNo=selectedEscalatorNo, sPosition=selectedPosition).values_list()
            selectedDefectList = defect.objects.filter(sDefectHandrailID=selectedHandrail[0][0], sDefectTimeStamp__date__range=(startDate, endDate)).order_by('sSeverity', '-sDefectTimeStamp')[:200]
            print(selectedDefectList)
        except:
            print("no data")
            
    
        # pagination
        current_page = int(request.GET.get('page_num', 1)) 
        paginator = Paginator(selectedDefectList, 12)

        print(paginator)
    
        if paginator.num_pages > 11:
            if current_page - 5 < 1:
                page_range = range(1, 12)
            elif current_page + 5 > paginator.num_pages:
                page_range = range(paginator.num_pages - 10, paginator.num_pages + 1)
            else:
                page_range = range(current_page - 5, current_page + 5)
        else:
            page_range = paginator.page_range
        try:
            page = paginator.page(current_page)
        except Exception as E:
            current_page = 1 
            page = paginator.page(current_page)

        return render(request, 'logs.html', locals())

    elif 'export' in request.GET:
        
        selectedLine = request.GET.get('selectedLine',)
        selectedStation = request.GET.get('selectedStation',)
        selectedEscalatorNo = request.GET.get('selectedEscalatorNo',)
        selectedPosition = request.GET.get('selectedPosition',)
        selectedDefectType = request.GET.get('selectedDefectType',)
        dateRange = request.GET.get('dateRange', "2023-01-01 to 2024-06-21")
        startDate = dateRange[:10]          
        endDate = dateRange[-10:]

        selectedDefectList = []

        try:
            if selectedLine and selectedStation and selectedEscalatorNo and selectedPosition and selectedDefectType:
                selectedHandrail = handrail.objects.filter(sLine=selectedLine, sStation=selectedStation, sEscNo=selectedEscalatorNo, sPosition=selectedPosition).values_list()
            selectedDefectList = defect.objects.filter(sDefectHandrailID=selectedHandrail[0][0], sDefectTimeStamp__date__range=(startDate, endDate)).order_by('sSeverity', '-sDefectTimeStamp')[:200]
        except:
            print("no data")         

        filename = "Defect Data"
        response = HttpResponse(content_type='text/csv')
        response['Content-Disposition'] = 'attachment; filename="Report - {}.csv"'.format(filename)

        writer = csv.writer(response)
        writer.writerow(['Line', 'Station', 'Escalator No.', 'Position','Defect Type', 'Time Stamp', 'Distance from Start Point(mm)', 'Speed(m/s)', 'Length(mm)', 'Width(mm)', 'Depth(mm)', 'Severity'])
        
        if selectedDefectList:
            records = selectedDefectList.values_list(
                                                'sDefectHandrailID__sLine', 
                                                'sDefectHandrailID__sStation', 
                                                'sDefectHandrailID__sEscNo', 
                                                'sDefectHandrailID__sPosition',
                                                'sDefectDefectTypeID',
                                                'sDefectTimeStamp',
                                                'sDistanceFromStartPoint',
                                                'sSpeed',
                                                'sLength',
                                                'sWidth',
                                                'sDepth',
                                                'sSeverity'
                                                )
            for record in records:
                writer.writerow(record)
        return response

    return render(request, 'logs.html', locals())



@csrf_exempt
def getData(request):

    if request.method == 'POST':

        body = json.loads(request.body)

        line = body["line"]
        station = body["station"]
        escNo = body["escNo"]
        postion = body["position"]
        speed = body["speed"]
        distanceFromStartPoint = body["distanceFromStartPoint"]
        fileTime = body["fileTime"]
        length = body["length"]
        width = body["width"]
        depth = body["depth"]
        defectType = body["defectType"]
        photoFileName = body["photoFileName"]
        photo = base64.b64decode(body["__photoFile"])

        print(line)
        print(station)
        print(escNo)
        print(postion)
        print(speed)
        print(distanceFromStartPoint)
        print(fileTime)
        print(length)
        print(width)
        print(depth)
        print(defectType)
        print(photoFileName)
        print(photo)

        handrailID = handrail.objects.filter(sLine=line, sStation=station, sEscNo=escNo, sPosition=postion).values()
        defectTypeID = defectType.objects.filter(sDefectTypeID=defectType).values()

        print(handrailID)
        print(defectTypeID)

        inputPath = os.path.dirname(__file__) + '/static/defectPhoto/'
        with open(inputPath+photoFileName, 'wb') as f:
            f.write(photo)
        
        p = defect(sDefectHandrailID=handrailID['sHandrailID'],
                   sDefectTimeStamp=fileTime, 
                   sLength=length,
                   sWidth=width,
                   sDepth=depth,
                   sDefectDefectTypeID=defectTypeID['sDefectTypeID'],
                   sDistanceFromStartPoint=distanceFromStartPoint,
                   sSpeed=speed,
                   sDefectPhotoLocation=photoFileName)
        p.save()
        print('data saved in DB')

    return HttpResponse(status=200)

