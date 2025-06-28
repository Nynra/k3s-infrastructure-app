apiVersion: external-secrets.io/v1
kind: ExternalSecret
metadata:
  name: grafana-admin-credentials
  namespace: {{ .Values.kubePrometheusStack.namespace }}
  annotations:
    argocd.argoproj.io/sync-wave: "-10"
spec:
  refreshInterval: {{ .Values.kubePrometheusStack.grafana.externalSecret.refreshInterval }}
  secretStoreRef:
    kind: ClusterSecretStore
    name: {{ .Values.kubePrometheusStack.grafana.externalSecret.remoteSecretStore }}
  target:
    creationPolicy: Owner
  data:
    - secretKey: username
      remoteRef:
        key: {{ .Values.kubePrometheusStack.grafana.externalSecret.remoteSecretName }}
        property: {{ .Values.kubePrometheusStack.grafana.externalSecret.userPropertyName }}
    - secretKey: password
      remoteRef:
        key: {{ .Values.kubePrometheusStack.grafana.externalSecret.remoteSecretName }}
        property: {{ .Values.kubePrometheusStack.grafana.externalSecret.passwordPropertyName }}