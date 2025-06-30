{{- range .Values.certManager.certs }}
---
apiVersion: cert-manager.io/v1
kind: Certificate
metadata:
  name: {{ .commonName | replace "." "-" }}-cert
  namespace: {{ .namespace }}
  annotations:
    argocd.argoproj.io/sync-wave: "-8"
    reflector.v1.k8s.emberstack.com/reflection-allowed: "true"
    reflector.v1.k8s.emberstack.com/reflection-allowed-namespaces: ""
spec:
  secretName: {{ .secretName }}
  commonName: {{ .commonName }}
  dnsNames:
    {{- range .dnsNames }}
    - "{{ . }}"
    {{- end }}
  issuerRef:
    name: {{ .clusterIssuer }}
    kind: ClusterIssuer
{{- end }}