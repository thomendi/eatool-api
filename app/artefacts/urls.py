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
    path('create_linked_task/', views.create_linked_task_artefact, name='create_linked_task_artefact'),
    path('by_name/<str:name>/', views.get_artefact_by_name, name='get_artefact_by_name'),
    path('subtype/<str:subtype>/', views.get_artefacts_by_subtype, name='get_artefacts_by_subtype'),
    path('linked/<str:idart>/', views.get_linked_artefacts, name='get_linked_artefacts'),

]
