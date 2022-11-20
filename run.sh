#!/bin/bash

# init
CURRENT_PATH=$(pwd)
IMAGE_NAME="denden047/stable-diffusion-webui"

# run
run_cmd="/bin/bash"

docker build -t ${IMAGE_NAME} . && \
docker run -it --rm \
    --gpus '"device=0"' \
    -v "${CURRENT_PATH}:/work" \
    -w "/work" \
    --ipc=host \
    ${IMAGE_NAME} \
    ${run_cmd}