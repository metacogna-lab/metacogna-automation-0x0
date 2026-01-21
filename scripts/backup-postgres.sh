#!/bin/bash
set -e

OUT=backups/postgres-$(date +%F-%H%M).sql.gz

pg_dump "$POSTGRES_DSN" | gzip > "$OUT"
