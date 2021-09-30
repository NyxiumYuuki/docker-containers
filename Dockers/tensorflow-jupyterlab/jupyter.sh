#!/usr/bin/env bash
set -eu

jupyter lab --ip=0.0.0.0 --port=8080 --no-browser --allow-root --collaborative \
  --ServerApp.token='' \
  --ServerApp.custom_display_url=${JOB_URL_SCHEME-jobUrl}${JOB_ID-jobId}-8080.${JOB_HOST-jobHost} \
  --ServerApp.allow_remote_access=True \
  --ServerApp.allow_origin='*' \
  --ServerApp.disable_check_xsrf=True