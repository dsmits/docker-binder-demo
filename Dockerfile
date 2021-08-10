FROM continuumio/miniconda3

ARG NB_USER=jupyter

RUN adduser --disabled-password $NB_USER
RUN apt update -y && \
    apt install -y imagemagick && \
    pip install jupyter matplotlib pandas seaborn

USER $NB_USER
COPY $PWD/notebooks/ /home/$NB_USER/
WORKDIR /home/$NB_USER


CMD ["jupyter", "notebook", "--no-browser", "--ip=0.0.0.0"]