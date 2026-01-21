#!/bin/bash
set -e

OUT=backups/workflows-$(date +%F-%H%M).json

curl -s \
  -H "Authorization: Bearer $N8N_API_KEY" \
  "$N8N_HOST/api/v1/workflows" \
  > "$OUT"
