# A base image that comes with a small number of Python packages
FROM continuumio/miniconda3:4.10.3-alpine

# mybinder requires the argument NB_USER to specify a non-root user that will be used to run jupyter
ARG NB_USER=jupyter

RUN adduser --disabled-password --gecos "" $NB_USER

# Install the required dependencies
RUN apk add imagemagick && \
    pip install jupyter matplotlib seaborn pandas

#COPY notebooks/ /home/$NB_USER/
# Switch to specified non-root user
USER $NB_USER

WORKDIR /home/$NB_USER

CMD ["jupyter", "notebook", "--no-browser", "--ip=0.0.0.0"]