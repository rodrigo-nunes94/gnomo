#!/usr/bin/env bash
set -euo pipefail

PROFILE="cpu"

# NVIDIA: precisa do driver + nvidia-container-toolkit
if command -v nvidia-smi >/dev/null 2>&1; then
  if docker info 2>/dev/null | grep -qi 'Runtimes:.*nvidia'; then
    PROFILE="gpu-nvidia"
  fi
fi

# AMD ROCm: /dev/kfd e /dev/dri no host
if [[ -e /dev/kfd && -e /dev/dri ]]; then
  PROFILE="gpu-amd"
fi

# Intel (opcional/comunitário): /dev/dri presente e variável ONEAPI/Level Zero
if [[ "${PROFILE}" == "cpu" && -e /dev/dri ]]; then
  # Descomente se você preparou a imagem Intel:
  # PROFILE="gpu-intel"
  :
fi

echo ">> Iniciando com profile: ${PROFILE}"
docker compose --profile "${PROFILE}" up -d
