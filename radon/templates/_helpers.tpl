{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "radon.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "radon.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- printf .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Generate chart secret name
*/}}
{{- define "radon.secretName" -}}
{{ default (include "radon.fullname" .) .Values.existingSecret }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "radon.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
{{ default (include "radon.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
{{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Generate chart image secret name
*/}}
{{- define "radon.imagePullSecret" -}}
{{- printf "%s-%s" (include "radon.fullname" .) "radonimagesecret" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
radon backend address
*/}}
{{- define "radon.backendaddress" -}}
{{- if .Values.backend_replicas -}}
{{- $host := printf "%s-mysql.%s-mysql" .Release.Name .Release.Name -}}
{{- if .Values.backend_host -}}
{{- $host := .Values.backend_host -}}
{{- end -}}
{{- printf "%s,%s,%g,%s,%s,%g" .Values.backend_name $host .Values.backend_port .Values.backend_user .Values.backend_password .Values.backend_maxconnections | trimSuffix "-" -}}
{{- else -}}
{{ .Values.backend_name_host_port_user_password_maxconnections }}
{{- end -}}
{{- end -}}
