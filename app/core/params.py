"""
OpenAPI parameters for the API.
"""
from drf_spectacular.utils import OpenApiParameter

COMPANY_PARAMETER = OpenApiParameter(
    name='company',
    type=str,
    location=OpenApiParameter.QUERY,
    description='Filter by company name',
    required=False
)
