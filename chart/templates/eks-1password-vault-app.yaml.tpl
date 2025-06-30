apiVersion: external-secrets.io/v1
kind: ClusterSecretStore
metadata:
  name: {{ .Values.vaults.mainVault.name }}
  annotations:
    argocd.argoproj.io/sync-wave: "-15"
    # Cannot validate as the needed CRD is not installed yet
spec:
  provider:
    onepassword:
      connectHost: http://onepassword-connect:8080
      vaults:
        {{ .Values.vaults.mainVault.vaultName }}: 1
      auth:
        secretRef:
          connectTokenSecretRef:
            name: {{ .Values.vaults.mainVault.connectTokenSecretName }}
            key: token
            namespace: {{ .Values.vaults.mainVault.connectTokenNamespace }}
  # destination:
  #   name: {{ .Values.global.argocdConfig.server }}
  #   namespace: {{ .Values.global.argocdConfig.namespace }}
---
