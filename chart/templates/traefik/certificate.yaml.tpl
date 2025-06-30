apiVersion: external-secrets.io/v1
kind: ExternalSecret
metadata:
  name: {{ .Values.traefik.dashboard.externalCert.name }}
  # Argocd cannot add secrets to the default namespace but issuers look
  # in the cert-manager namespace automatically
  namespace: {{ .Values.traefik.namespace }}
  annotations:
    argocd.argoproj.io/sync-wave: "-4"
spec:
  secretStoreRef:
    kind: ClusterSecretStore
    name: {{ .Values.traefik.dashboard.externalCert.remoteSecretStore }}
  target:
    creationPolicy: Owner
  data:
    - secretKey: tls.crt
      remoteRef:
        key: {{ .Values.traefik.dashboard.externalCert.remoteSecretName | quote }}
        property: tls_crt
    - secretKey: tls.key
      remoteRef:
        key: {{ .Values.traefik.dashboard.externalCert.remoteSecretName | quote }}
        property: tls_key