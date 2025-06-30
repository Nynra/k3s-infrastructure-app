apiVersion: traefik.io/v1alpha1
kind: Middleware
metadata:
  name: ratelimit
spec:
  rateLimit:
    period: {{ .Values.traefik.rateLimiting.period }}
    average: {{ .Values.traefik.rateLimiting.average }}
    burst: {{ .Values.traefik.rateLimiting.burst }}