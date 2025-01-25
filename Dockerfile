FROM ghcr.io/codekaizen-github/ansible-docker-volume-backup:v1 AS base

ARG LABEL_ORG_OPENCONTAINERS_IMAGE_SOURCE=""

LABEL org.opencontainers.image.source=${LABEL_ORG_OPENCONTAINERS_IMAGE_SOURCE}

COPY src /
