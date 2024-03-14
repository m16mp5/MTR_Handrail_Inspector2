from django.contrib import admin
from django.contrib.auth.models import User
from webapp.models import handrail, defectType, defectTypeThreshold



class UserAdmin(admin.ModelAdmin):
    list_display = ['username','first_name','last_name','is_staff']
    ordering=('username',)

class HandrailAdmin(admin.ModelAdmin):
    list_display = ['sHandrailID', 'sLine', 'sStation', 'sEscNo', 'sPosition']
    search_fields = ['sLine', 'sStation']
    list_filter = ['sLine', 'sStation', 'sEscNo','sPosition']
    list_editable = ('sLine', 'sStation', 'sEscNo','sPosition')
    ordering = ('sHandrailID',)

class DefectTypeAdmin(admin.ModelAdmin):
    list_display = ['sDefectTypeID', 'sDefectTypeName']
    search_fields = ['sDefectTypeName',]
    list_filter = ['sDefectTypeName',]
    list_editable = ('sDefectTypeName',)
    ordering = ('sDefectTypeID',)    

class DefectThresholdAdmin(admin.ModelAdmin):
    list_display = ['sDefectTypeThresholdID', 'sThresholdDefectTypeID','sSeverity', 'sLengthThreshold', 'sWidthhThreshold', 'sDepthThreshold']
    search_fields = ['sSeverity']
    list_filter = ['sSeverity']
    list_editable = ('sThresholdDefectTypeID', 'sSeverity', 'sLengthThreshold', 'sWidthhThreshold','sDepthThreshold')
    ordering = ('sDefectTypeThresholdID',)

admin.site.unregister(User)
admin.site.register(User, UserAdmin)

admin.site.site_header = 'MTR Handrail Defect Management Portal'
admin.site.site_title = 'MTR Handrail Defect Management Portal'
admin.site.index_title = 'MTR Handrail Defect Management Portal'

admin.site.register(handrail, HandrailAdmin)
admin.site.register(defectType, DefectTypeAdmin)
admin.site.register(defectTypeThreshold, DefectThresholdAdmin)
