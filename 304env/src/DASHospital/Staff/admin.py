from django.contrib import admin

# Register your models here.

from .models import Doctor
from .models import Generalpracticioner
from .models import Specialist

admin.site.register(Doctor)
admin.site.register(Generalpracticioner)
admin.site.register(Specialist)