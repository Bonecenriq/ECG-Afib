#! /bin/bash

if [[ "$1" == "GPU" ]]; then
    docker run \
    --rm -ti \
    --mount type=bind,source="$(pwd)",target=/app/code -w /app/code \
    --gpus all --cpus="8" --shm-size=8g \
    ecg-af:latest python /app/run/test.py

elif [[ "$1" == "CPU" ]]; then
    docker run \
    --rm -ti \
    --mount type=bind,source="$(pwd)",target=/app/code -w /app/code \
    --cpus="8" --shm-size=8g \
    ecg-af:latest python /app/run/test.py
    
fi
