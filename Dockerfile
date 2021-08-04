FROM jupyter/minimal-notebook

USER root

RUN apt update -y && apt install -y ffmpeg

USER $NB_USER