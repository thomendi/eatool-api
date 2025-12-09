from django.shortcuts import render
# roles/views.py
from rest_framework import viewsets
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import AllowAny

from core.permissions import IsAuthenticatedOrOptions  # si ya lo usas
from core.models import Roles
from roles import serializers

class RolesViewSet(viewsets.ModelViewSet):
    serializer_class = serializers.RoleDetailSerializer
    queryset = Roles.objects.all()
    authentication_classes = [TokenAuthentication]
    # Puedes cambiar a [AllowAny] en desarrollo si quieres que esté público.
    permission_classes = [IsAuthenticatedOrOptions]

    def get_queryset(self):
        return self.queryset.order_by('id')

    def get_serializer_class(self):
        if self.action == 'list':
            return serializers.RoleSerializer
        return self.serializer_class

    def perform_create(self, serializer):
        serializer.save()
