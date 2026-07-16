#!/bin/bash
# Default entrypoint for the container, run when no command is given to
# `apptainer run`. Replace the body with whatever makes sense for this project
# (a training run, a pipeline, a server, ...).
#
# The project venv is already on PATH, and the working directory is the bind
# mount /mnt/<project>, so scripts can be called directly:
#
#   python -m python_base.hello
set -euo pipefail

echo "No entrypoint defined for this project yet."
echo "Edit containers/entrypoint.sh, or pass a command:"
echo "  apptainer run project.sif python -m python_base.hello"
