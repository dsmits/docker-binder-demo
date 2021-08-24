# A base image that comes with a small number of Python packages
FROM continuumio/miniconda3

# mybinder requires the argument NB_USER to specify a non-root user that will be used to run jupyter
ARG NB_USER=jupyter

RUN adduser --disabled-password --gecos "" $NB_USER

# Install the required dependencies
RUN apt update -y && \
    apt install -y imagemagick && \
    pip install jupyter

# Switch to specified non-root user
USER $NB_USER

WORKDIR /home/$NB_USER

CMD ["jupyter", "notebook", "--no-browser", "--ip=0.0.0.0"]