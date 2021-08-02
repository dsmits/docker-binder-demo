FROM jupyter/minimal-notebook
USER root

RUN apt update -y && apt install -y --no-install-recommends ffmpeg

USER ${NB_UID}