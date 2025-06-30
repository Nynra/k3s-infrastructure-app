apiVersion: v1
kind: Namespace
metadata:
  name: {{ .Values.kubePrometheusStack.namespace }}
  annotations:
    argocd.argoproj.io/sync-wave: "-5"
