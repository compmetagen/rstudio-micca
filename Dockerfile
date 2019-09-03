FROM rocker/verse:3.6.1

RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libfftw3-dev \
    libtiff5-dev

ADD install.R /tmp/
RUN R -f /tmp/install.R

RUN apt-get clean \
  && rm -rf /tmp/* \
  && rm -rf /var/lib/apt/lists/*
