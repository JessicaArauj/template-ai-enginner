#!/usr/bin/env bash
set -euo pipefail

VENV_DIR=".venv"

if [[ -n "${PYTHON_BIN:-}" ]]; then
  read -r -a PYTHON_CMD <<<"${PYTHON_BIN}"
elif command -v py >/dev/null 2>&1 && py -3.11 -V >/dev/null 2>&1; then
  PYTHON_CMD=(py -3.11)
else
  PYTHON_CMD=(python)
fi

echo "Using python executable: ${PYTHON_CMD[*]}"

create_venv() {
  echo "Creating virtual environment in ${VENV_DIR}..."
  "${PYTHON_CMD[@]}" -m venv "${VENV_DIR}"
}

if [ ! -d "${VENV_DIR}" ]; then
  create_venv
else
  echo "Virtual environment already exists at ${VENV_DIR}."
fi

if [ -d "${VENV_DIR}/Scripts" ]; then
  ACTIVATE_SCRIPT="${VENV_DIR}/Scripts/activate"
  if [ -x "${VENV_DIR}/Scripts/python.exe" ]; then
    VENV_PYTHON="${VENV_DIR}/Scripts/python.exe"
  else
    VENV_PYTHON="${VENV_DIR}/Scripts/python"
  fi
else
  ACTIVATE_SCRIPT="${VENV_DIR}/bin/activate"
  VENV_PYTHON="${VENV_DIR}/bin/python"
fi

if [ ! -x "${VENV_PYTHON}" ] || ! "${VENV_PYTHON}" -V >/dev/null 2>&1; then
  echo "Existing virtual environment is invalid or python executable missing."
  echo "Recreating ${VENV_DIR}..."
  rm -rf "${VENV_DIR}"
  create_venv
  if [ -d "${VENV_DIR}/Scripts" ]; then
    ACTIVATE_SCRIPT="${VENV_DIR}/Scripts/activate"
    if [ -x "${VENV_DIR}/Scripts/python.exe" ]; then
      VENV_PYTHON="${VENV_DIR}/Scripts/python.exe"
    else
      VENV_PYTHON="${VENV_DIR}/Scripts/python"
    fi
  else
    ACTIVATE_SCRIPT="${VENV_DIR}/bin/activate"
    VENV_PYTHON="${VENV_DIR}/bin/python"
  fi
fi

if [ -f "${ACTIVATE_SCRIPT}" ]; then
  echo "Activating virtual environment..."
  # shellcheck disable=SC1090
  source "${ACTIVATE_SCRIPT}"
else
  echo "Activation script not found at ${ACTIVATE_SCRIPT}; will skip auto-activation."
fi

echo "Upgrading pip..."
"${VENV_PYTHON}" -m pip install -q --upgrade pip

echo "Clearing pip cache..."
if "${VENV_PYTHON}" -m pip cache purge >/dev/null 2>&1; then
  echo "Pip cache cleared."
else
  echo "Warning: unable to clear pip cache; continuing."
fi

echo "Installing dependencies from requirements.txt..."
"${VENV_PYTHON}" -m pip install --no-cache-dir -q -r requirements.txt

echo
echo "Virtual environment is ready."
if [ -d "${VENV_DIR}/Scripts" ]; then
  echo "Activate it with: ${VENV_DIR}/Scripts/activate"
else
  echo "Activate it with: source ${VENV_DIR}/bin/activate"
fi