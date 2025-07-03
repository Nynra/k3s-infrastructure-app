apiVersion: v1
kind: Namespace
metadata:
  name: {{ .Values.prometheus.namespace }}
  annotations:
    argocd.argoproj.io/sync-wave: "-5"
