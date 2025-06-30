apiVersion: v1
kind: Namespace
metadata:
  name: {{ .Values.longhorn.namespace }}
  annotations:
    argocd.argoproj.io/sync-wave: "-5"