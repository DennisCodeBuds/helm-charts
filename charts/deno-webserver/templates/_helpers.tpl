{{/*
Expand the name of the chart.
*/}}
{{- define "deno-webserver.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "deno-webserver.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "deno-webserver.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "deno-webserver.labels" -}}
helm.sh/chart: {{ include "deno-webserver.chart" . }}
{{ include "deno-webserver.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "deno-webserver.selectorLabels" -}}
app.kubernetes.io/name: {{ include "deno-webserver.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "deno-webserver.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "deno-webserver.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}


{{/*
Generate dynamic host base on the Release name if the TLD is set
In a range of hosts set a Data dictionary to get the right values
{{$data := dict "host" . "Release" $.Release }} ant then include this with the data
{{ include "host-url" $data }}
*/}}
{{- define "host-url"}}
{{- if .host.tld }}
{{- print .Release.Name "." .host.tld }}
{{- else }}
{{- print .host.host }}
{{- end }}
{{- end }}

