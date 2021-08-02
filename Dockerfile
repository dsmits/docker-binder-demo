FROM jupyter/minimal-notebook

RUN apt update -y && apt install ffmpeg