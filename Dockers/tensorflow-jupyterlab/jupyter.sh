#!/usr/bin/env bash
set -eu

jupyter lab --ip=0.0.0.0 --port=8080 --allow-root --collaborative \
  --ServerApp.token='' \
--ServerApp.custom_display_url=${JOB_URL_SCHEME}${JOB_ID}-8080.${JOB_HOST} \
  --ServerApp.allow_remote_access=True \
  --ServerApp.allow_origin='*' \
  --ServerApp..disable_check_xsrf=True