#!/bin/bash
set -e

gsutil -m cp backups/* gs://$GCS_BUCKET/n8n/
