{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "noc.name" -}}
  {{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "noc.activator.fullname" -}}
{{- printf "%s-%s" .Release.Name "activator" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.bi.fullname" -}}
{{- printf "%s-%s" .Release.Name "bi" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.card.fullname" -}}
{{- printf "%s-%s" .Release.Name "card" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.chwriter.fullname" -}}
{{- printf "%s-%s" .Release.Name "chwriter" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.classifier.fullname" -}}
{{- printf "%s-%s" .Release.Name "classifier" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.correlator.fullname" -}}
{{- printf "%s-%s" .Release.Name "correlator" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.datasource.fullname" -}}
{{- printf "%s-%s" .Release.Name "datasource" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.datastream.fullname" -}}
{{- printf "%s-%s" .Release.Name "datastream" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.discovery.fullname" -}}
{{- printf "%s-%s" .Release.Name "discovery" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.escalator.fullname" -}}
{{- printf "%s-%s" .Release.Name "escalator" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.front.fullname" -}}
{{- printf "%s-%s" .Release.Name "front" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.grafanads.fullname" -}}
{{- printf "%s-%s" .Release.Name "grafanads" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.login.fullname" -}}
{{- printf "%s-%s" .Release.Name "login" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.mrt.fullname" -}}
{{- printf "%s-%s" .Release.Name "mrt" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.mib.fullname" -}}
{{- printf "%s-%s" .Release.Name "mib" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.mailsender.fullname" -}}
{{- printf "%s-%s" .Release.Name "mailsender" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.nbi.fullname" -}}
{{- printf "%s-%s" .Release.Name "nbi" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.ping.fullname" -}}
{{- printf "%s-%s" .Release.Name "ping" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.sae.fullname" -}}
{{- printf "%s-%s" .Release.Name "sae" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.scheduler.fullname" -}}
{{- printf "%s-%s" .Release.Name "scheduler" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.selfmon.fullname" -}}
{{- printf "%s-%s" .Release.Name "selfmon" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.static.fullname" -}}
{{- printf "%s-%s" .Release.Name "static" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.syslogcollector.fullname" -}}
{{- printf "%s-%s" .Release.Name "syslogcollector" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.trapcollector.fullname" -}}
{{- printf "%s-%s" .Release.Name "trapcollector" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.tgsender.fullname" -}}
{{- printf "%s-%s" .Release.Name "tgsender" | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- define "noc.web.fullname" -}}
{{- printf "%s-%s" .Release.Name "web" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "noc.chart" -}}
  {{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "noc.labels" -}}
app.kubernetes.io/name: {{ include "noc.name" . }}
helm.sh/chart: {{ include "noc.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}
