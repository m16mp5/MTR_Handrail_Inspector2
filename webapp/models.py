from django.db import models
from django.contrib.auth import get_user_model

#Create your models here.

class handrail(models.Model):
    sHandrailID = models.AutoField(primary_key=True, verbose_name="#")
    sHandrailCode = models.CharField(max_length=50, null=False, verbose_name="Handrail Code")
    sLine = models.CharField(max_length=50, null=False, verbose_name="Line")
    sStation = models.CharField(max_length=50, null=False, verbose_name="Station")
    sEscNo = models.CharField(max_length=50, null=False, verbose_name="Equipment No.")
    sPosition = models.CharField(max_length=10, null=False, verbose_name="Position")

class defectType(models.Model):
    sDefectTypeID = models.AutoField(primary_key=True, verbose_name="Defect Type ID")
    sDefectTypeName = models.CharField(max_length=30, null=False, verbose_name="Defect Type")
    
    def __str__(self):
        return self.sDefectTypeName

class defect(models.Model):
    sDefectID = models.AutoField(primary_key=True) 
    sDefectHandrailID = models.ForeignKey(handrail, on_delete=models.CASCADE)
    sDefectTimeStamp = models.DateTimeField(null=False, blank=True)
    sLength = models.FloatField(null=False)
    sWidth = models.FloatField(null=False)
    sDepth = models.FloatField(null=False)
    sDefectDefectTypeID = models.ForeignKey(defectType, on_delete=models.CASCADE)
    sDistanceFromStartPoint = models.FloatField(null=False)
    sSpeed = models.FloatField(null=False)
    sDefectPhotoLocation = models.CharField(max_length=200, null=False)
    sSeverity = models.CharField(max_length=30, null=False)

class defectTypeThreshold(models.Model):
    sDefectTypeThresholdID = models.AutoField(primary_key=True, verbose_name="#")
    sThresholdDefectTypeID = models.ForeignKey(defectType, on_delete=models.CASCADE, verbose_name="Defect Type ID")
    sSeverity = models.CharField(max_length=30, null=False, verbose_name="Severity")
    sLengthThreshold = models.FloatField(null=False, verbose_name="Length Threshold")
    sWidthhThreshold = models.FloatField(null=False, verbose_name="Width Threshold")
    sDepthThreshold = models.FloatField(null=False, verbose_name="Depth Threshold")


