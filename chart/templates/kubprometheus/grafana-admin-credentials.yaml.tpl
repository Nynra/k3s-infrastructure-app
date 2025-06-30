apiVersion: external-secrets.io/v1
kind: ExternalSecret
metadata:
  name: grafana-admin-credentials
  namespace: {{ .Values.prometheus.namespace }}
  annotations:
    argocd.argoproj.io/sync-wave: "-10"
spec:
  refreshInterval: {{ .Values.grafana.externalSecret.refreshInterval }}
  secretStoreRef:
    kind: ClusterSecretStore
    name: {{ .Values.grafana.externalSecret.remoteSecretStore }}
  target:
    creationPolicy: Owner
  data:
    - secretKey: username
      remoteRef:
        key: {{ .Values.grafana.externalSecret.remoteSecretName }}
        property: {{ .Values.grafana.externalSecret.userPropertyName }}
    - secretKey: password
      remoteRef:
        key: {{ .Values.grafana.externalSecret.remoteSecretName }}
        property: {{ .Values.grafana.externalSecret.passwordPropertyName }}