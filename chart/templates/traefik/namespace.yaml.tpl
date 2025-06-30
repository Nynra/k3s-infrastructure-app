apiVersion: v1
kind: Namespace
metadata:
  name: {{ .Values.traefik.namespace }}
  annotations:
    argocd.argoproj.io/sync-wave: "-5"
    