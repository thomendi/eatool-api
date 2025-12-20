from rest_framework.viewsets import ModelViewSet
from .models import Risk
from .serializers import RiskSerializer


class RiskViewSet(ModelViewSet):
    queryset = Risk.objects.all().order_by('-created_at')
    serializer_class = RiskSerializer
