from django.shortcuts import render

from rest_framework import viewsets
from rest_framework.authentication import TokenAuthentication

from core.permissions import IsAuthenticatedOrOptions
from core.models import Applications
from applications import serializers


class ApplicationsViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.ApplicationDetailSerializer
    queryset = Applications.objects.all()
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticatedOrOptions]

    def get_queryset(self):
        return self.queryset.order_by('id')

    def get_serializer_class(self):
        if self.action == 'list':
            return serializers.ApplicationSerializer
        return self.serializer_class

    def perform_create(self, serializer):
        serializer.save()

