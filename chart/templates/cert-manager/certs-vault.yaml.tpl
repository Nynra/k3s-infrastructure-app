apiVersion: external-secrets.io/v1
kind: ClusterSecretStore
metadata:
  name: {{ .Values.certManager.certsVault.name }}
  annotations:
    argocd.argoproj.io/sync-wave: "-15"
    # Cannot validate as the needed CRD is not installed yet
    argocd.argoproj.io/sync-options: Validate=false
spec:
  provider:
    onepassword:
      connectHost: http://onepassword-connect:8080
      vaults:
        {{ .Values.certManager.certsVault.vaultName }}: 1
      auth:
        secretRef:
          connectTokenSecretRef:
            name: {{ .Values.certManager.certsVault.connectTokenSecretName }}
            key: token
            namespace: {{ .Values.certManager.certsVault.connectTokenNamespace }}
  # destination:
  #   name: {{ .Values.global.argocdConfig.server }}
  #   namespace: {{ .Values.global.argocdConfig.namespace }}
