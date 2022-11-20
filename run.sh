#!/bin/bash

# init
PWD=$(pwd)
IMAGE_NAME="denden047/stable-diffusion-webui"

# run
run_cmd="/bin/bash"

docker build -t ${IMAGE_NAME} . && \
docker run --rm \
    --gpus '"device=0"' \
    -p 7860:8080 \
    -v ${PWD}/.cache/app:/root/.cache \
    -v ${PWD}/.cache/facexlib/:/app/src/facexlib/facexlib/weights/ \
    -v ${PWD}/.cache/gfpgan/:/app/gfpgan/weights/ \
    -v ${PWD}/models/:/models/ \
    -v ${PWD}/outputs/:/outputs/ \
    -e RUN_MODE=false \
    ${IMAGE_NAME}
