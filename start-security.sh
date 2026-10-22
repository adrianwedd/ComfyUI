#!/bin/bash
set -euo pipefail
COMFY_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
COMFY_PYTHON="$COMFY_ROOT/.venv/bin/python3"
SSL_CERT_FILE="$("$COMFY_PYTHON" -c 'import certifi; assert tuple(map(int, certifi.__version__.split("."))) >= (2026, 10, 19); print(certifi.where())')"
SSL_CERT_DIR="$COMFY_ROOT/.venv/security-empty-ca-dir"
mkdir -p "$SSL_CERT_DIR"
export SSL_CERT_FILE SSL_CERT_DIR
exec "$COMFY_PYTHON" "$COMFY_ROOT/main.py" --listen 127.0.0.1 --port 8188
