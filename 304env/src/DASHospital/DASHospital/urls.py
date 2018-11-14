"""DASHospital URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from pages.views import sign_in_view, create_user_view
from Staff.views import nurse_detail_view, lab_technician_detail_view
from WeeklySchedule.views import ScheduledTime_create_view, ScheduledTime_update_view

urlpatterns = [
    path('', sign_in_view, name='home'),
    path('createPatient/', create_patient),
    path('main/', profile),
    path('information/', account_information),
    path('Nurse/', nurse_detail_view),
    path('admin/', admin.site.urls),
    path('LabTechnician/', lab_technician_detail_view),
    path('schedule/<int:wid>/create/', ScheduledTime_create_view.as_view(), name = 'schedule-create')

]
