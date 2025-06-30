apiVersion: traefik.io/v1alpha1
kind: Middleware
metadata:
  name: ratelimit
spec:
  rateLimit:
    period: {{ .Values.traefikMiddlewares.rateLimiting.period }}
    average: {{ .Values.traefikMiddlewares.rateLimiting.average }}
    burst: {{ .Values.traefikMiddlewares.rateLimiting.burst }}