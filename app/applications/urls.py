from django.urls import path, include
from rest_framework.routers import DefaultRouter
from applications import views

router = DefaultRouter()
router.register('application', views.ApplicationsViewSet)

app_name = "applications"

urlpatterns = [
    path('', include(router.urls)),
]
