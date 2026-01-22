"""
Mixins for views.
"""

class CompanyFilterMixin:
    """
    Mixin to filter queryset by company query parameter.
    """
    def get_queryset(self):
        """
        Return objects for the current authenticated user only.
        """
        queryset = super().get_queryset()
        company = self.request.query_params.get('company')
        if company:
            queryset = queryset.filter(company=company)
        return queryset
