"""
Urls mappings for API Task Links
"""
from django.urls import (
    path,
    include,
)

from rest_framework.routers import DefaultRouter

from task_links import views


router = DefaultRouter()
router.register('task_link', views.TaskLinkViewSet)

app_name = 'task_links'

urlpatterns = [
    path('', include(router.urls)),
]
