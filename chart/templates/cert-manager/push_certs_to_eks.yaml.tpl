{{- range .Values.certManager.certs }}
---
apiVersion: external-secrets.io/v1
kind: PushSecret
metadata:
  name: {{ .name }}-push-secret
  namespace: {{ $.Values.certManager.namespace }}
spec:
  deletionPolicy: Delete
  updatePolicy: Replace
  # refreshInterval: 1h
  secretStoreRefs:
    - name: {{ $.Values.certManager.certsVault.name }}
      kind: ClusterSecretStore
  selector:
    secret:
      name: {{ .secretName }}
  data:
    - match:
        secretKey: tls.crt 
        remoteRef:
            remoteKey: tls.crt
            property: tls_crt
    - match:
        secretKey: tls.key
        remoteRef:
            remoteKey: tls.key
            property: tls_key
{{- end }}