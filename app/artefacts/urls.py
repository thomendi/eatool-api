"""
Urls mappings for API Artefacts
"""
from django.urls import (
    path,
    include,
)

from rest_framework.routers import DefaultRouter

from artefacts import views


router =  DefaultRouter()
router.register('artefacts', views.ArtefactsViewSet)

app_name = 'artefacts'

urlpatterns = [
    path('', include(router.urls))
]
