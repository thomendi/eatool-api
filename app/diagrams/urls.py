from django.urls import (
    path,
    include,
)

from rest_framework.routers import DefaultRouter

from diagrams import views



router =  DefaultRouter()
router.register('diagram', views.DiagramsViewSet)

app_name = 'diagrams'

urlpatterns = [
    path('', include(router.urls)),
    path('artefact/<str:idart>/', views.DiagramsViewSet.query_diagrams_by_artefact, name='get_diagrams_by_artefact')

]
