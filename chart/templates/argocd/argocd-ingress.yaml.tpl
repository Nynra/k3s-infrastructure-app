apiVersion: traefik.io/v1alpha1
kind: IngressRoute
metadata:
  name: argocd-ingress
  namespace: {{ .Values.global.argocdConfig.namespace }}
  annotations:
    kubernetes.io/ingress.class: traefik-external
spec:
  entryPoints:
    - websecure
  routes:
    - match: Host(`{{ .Values.argocd.dashboard.ingressUrl }}`)
      kind: Rule
      middlewares:
        - name: lan-only-ref
          kind: TraefikService
      services:
        - name: argocd-server
          port: 80
  tls:
    secretName: {{ .Values.argocd.dashboard.tlsSecretName }}
