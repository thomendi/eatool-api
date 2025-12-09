"""
Views for the task links APIs.
"""
from rest_framework import viewsets
from rest_framework.authentication import TokenAuthentication
from rest_framework.permissions import IsAuthenticated

from core.models import TaskLink
from task_links import serializers


class TaskLinkViewSet(viewsets.ModelViewSet):
    """View for manage task links APIs."""
    serializer_class = serializers.TaskLinkSerializer
    queryset = TaskLink.objects.all()
    authentication_classes = [TokenAuthentication]
    permission_classes = [IsAuthenticated]

    def get_queryset(self):
        """Retrieve task links."""
        return self.queryset.order_by('id')
