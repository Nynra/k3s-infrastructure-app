apiVersion: external-secrets.io/v1
kind: ExternalSecret
metadata:
  name: {{ .Values.grafana.externalCert.name }}
  namespace: {{ .Values.prometheus.namespace }}
  annotations:
    argocd.argoproj.io/sync-wave: "-4"
spec:
  secretStoreRef:
    kind: ClusterSecretStore
    name: {{ .Values.grafana.externalCert.remoteSecretStore }}
  target:
    creationPolicy: Owner
  data:
    - secretKey: tls.crt
      remoteRef:
        key: {{ .Values.grafana.externalCert.remoteSecretName | quote }}
        property: tls_crt
    - secretKey: tls.key
      remoteRef:
        key: {{ .Values.grafana.externalCert.remoteSecretName | quote }}
        property: tls_key