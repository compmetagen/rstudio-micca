FROM rocker/verse:3.6.1

RUN apt-get update && apt-get install -y --no-install-recommends \
    libfftw3-dev \
    libtiff5-dev

ADD install.R /tmp/
RUN R -f /tmp/install.R

# RDP classifier
RUN apt-get update && apt-get install -y \
    default-jre \
    wget \
    zip

ENV RDP_ZIP rdp_classifier_2.12.zip
ENV RDP_VERSION 2.12
ENV RDP_DOWNLOAD https://sourceforge.net/projects/rdp-classifier/files/rdp-classifier/$RDP_ZIP/download
ENV RDPPATH /opt/rdp_classifier

RUN wget $RDP_DOWNLOAD -O /tmp/$RDP_ZIP \
  && unzip /tmp/$RDP_ZIP -d /tmp \
  && mv /tmp/${RDP_ZIP%.*} $RDPPATH

# micca
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    python2.7 \
    python-pip \
    python-dev \
    python-numpy \
    python-scipy \
    python-matplotlib \
    git \
    autoconf \
    automake \
  && python -m pip install --upgrade pip \
  && pip install 'setuptools >=14.0' \
  && git clone https://github.com/compmetagen/micca.git /tmp/micca/ \
  && pip install /tmp/micca/

# Clean
RUN apt-get clean \
  && rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
