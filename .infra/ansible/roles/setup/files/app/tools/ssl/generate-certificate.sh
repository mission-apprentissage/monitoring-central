#!/usr/bin/env bash
set -euo pipefail

readonly SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ ! -f "/opt/monitoring/data/ssl/privkey.pem" ]; then
  cd "${SCRIPT_DIR}"
    docker build --tag monitoring_certbot certbot/
    docker run --rm --name monitoring_certbot \
      -p 80:5000 \
      -v /opt/monitoring/data/certbot:/etc/letsencrypt \
      -v /opt/monitoring/data/ssl:/ssl \
      monitoring_certbot generate "$@"
  cd -
else
  echo "Certificat SSL déja généré"
fi
