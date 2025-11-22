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
router.register('artefact', views.ArtefactsViewSet)

app_name = 'artefacts'

urlpatterns = [
    path('', include(router.urls)),
    path('list/', views.ArtefactsViewSet.get_artefacts_list, name='get_artefacts_list'),

]
