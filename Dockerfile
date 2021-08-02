FROM continuumio/anaconda3

RUN apt-get update -y && apt-get install -y ffmpeg