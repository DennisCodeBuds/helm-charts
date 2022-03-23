{{- define "maria-env" -}}
- name: MARIADB_ROOT_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-mariadb-secret
      key: rootPassword
{{- if .Values.mariadb.database }}
- name: MARIADB_DATABASE
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-mariadb-secret
      key: database
{{- end }}
{{- if .Values.mariadb.user }}
- name: MARIADB_USER
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-mariadb-secret
      key: user
{{- end }}
{{- if .Values.mariadb.password }}
- name: MARIADB_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ .Release.Name }}-mariadb-secret
      key: password
{{- end }}
{{- end }}
