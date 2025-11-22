"""
Views for the diagrams APIs.
"""
import json
from django.http import JsonResponse
from rest_framework import (viewsets, status)
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated
from django.forms.models import model_to_dict

from core.models import Diagrams
from diagrams import serializers


class DiagramsViewSet(viewsets.ModelViewSet):
    """View for manage diagrams APIs."""
    serializer_class = serializers.DiagramsDetailSerializer
    queryset = Diagrams.objects.all()
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        """Retrieve diagrams."""
        return self.queryset.order_by('id')

    def get_serializer_class(self):
        """Return the serializer class for request."""
        if self.action == 'list':
            return serializers.DiagramsSerializer

        return self.serializer_class

    def perform_create(self, serializer):
        """Create a new diagrams."""
        serializer.save()

    @api_view(['GET'])
    def query_diagrams_by_artefact(self, idart):
        """Retrive diagrams by artefacts."""
        try:
            diagrams = Diagrams.objects.get(idart=idart)
            data={
                "id": diagrams.id,
                "idart": diagrams.idart,
                "name": diagrams.name,
                "description": diagrams.description,
                "version": diagrams.version,
                "diagram":diagrams.diagram
            }

            return Response(data, status=status.HTTP_200_OK)
        except Diagrams.DoesNotExist:
            return JsonResponse(
                {"error": "Cliente no encontrado"},
                status=404
            )
