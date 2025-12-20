"""app URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
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
from drf_spectacular.views import (
    SpectacularAPIView,
    SpectacularSwaggerView,
)
from django.http import HttpResponse
from django.contrib import admin
from django.urls import path, include

def test(request):
    return HttpResponse("OK")

def cors_ok(request):
    response = HttpResponse()
    response["Access-Control-Allow-Origin"] = "http://localhost:5173"
    response["Access-Control-Allow-Credentials"] = "true"
    response["Access-Control-Allow-Headers"] = "authorization, content-type"
    response["Access-Control-Allow-Methods"] = "GET, POST, PUT, PATCH, DELETE, OPTIONS"
    return response

urlpatterns = [
    path("cors-test/", cors_ok),
    path('admin/', admin.site.urls),
    path('api/schema/', SpectacularAPIView.as_view(), name='api-schema'),
    path(
        'api/docs/',
        SpectacularSwaggerView.as_view(url_name='api-schema'),
        name='api-docs',
    ),
    path('api/user/', include('user.urls')),
    path('api/artefacts/', include('artefacts.urls')),
    path('api/diagrams/', include('diagrams.urls') ),
    path('api/applications/', include('applications.urls')),
    path('api/roles/', include('roles.urls')),
    path('api/', include('risks.urls')),
    path('api/task_links/', include('task_links.urls')),
    path("test/", test),
]
