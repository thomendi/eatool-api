from django.db import models


class Risk(models.Model):
    LEVEL_CHOICES = [
        ('Bajo', 'Bajo'),
        ('Medio', 'Medio'),
        ('Alto', 'Alto'),
        ('Crítico', 'Crítico'),
    ]

    IMPACT_CHOICES = [
        ('Bajo', 'Bajo'),
        ('Medio', 'Medio'),
        ('Alto', 'Alto'),
        ('Crítico', 'Crítico'),
    ]

    PROBABILITY_CHOICES = [
        ('Baja', 'Baja'),
        ('Media', 'Media'),
        ('Alta', 'Alta'),
    ]

    name = models.CharField(max_length=255)
    category = models.CharField(max_length=100)
    type = models.CharField(max_length=100)
    impact = models.CharField(max_length=20, choices=IMPACT_CHOICES)
    probability = models.CharField(max_length=20, choices=PROBABILITY_CHOICES)
    level = models.CharField(max_length=20, choices=LEVEL_CHOICES)
    description = models.TextField(blank=True)

    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name
