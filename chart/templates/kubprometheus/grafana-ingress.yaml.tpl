apiVersion: traefik.io/v1alpha1
kind: IngressRoute
metadata:
  name: grafana-ingress
  namespace: {{ .Values.kubePrometheusStack.namespace }}
  annotations: 
    kubernetes.io/ingress.class: traefik-internal
spec:
  entryPoints:
    - websecure
  routes:
    - match: Host(`{{ .Values.kubePrometheusStack.grafana.ingressUrl }}`)
      kind: Rule
      services:
        - name: kube-prometheus-stack-app-grafana  
          port: 80
          # sticky:
          #   cookie:
          #     httpOnly: true
          #     name: grafana
          #     secure: true
          #     sameSite: none
  tls:
    secretName: {{ .Values.kubePrometheusStack.grafana.tlsSecretName }}