# RStudio - micca

## Run the container from Docker Hub (Linux host)

```sh
docker run --rm -d -p 8787:8787 -e DISABLE_AUTH=true --name rstudio-micca \
    -v /Users/davide/micca:/home/rstudio/micca \
    compmetagen/rstudio-micca
```

Note:
> Files stored outside the `micca` directory will be lost when you stop the
container.

## Open RStudio

Open a browser and go to 127.0.0.1:8787.

## Stop (and destroy) the container

```sh
docker stop rstudio-micca
```

## (Optional) Build and run the container (Linux host)

```sh
git clone https://github.com/compmetagen/rstudio-micca.git
cd rstudio-micca
docker build . --tag rstudio-micca
docker run --rm -d -p 8787:8787 -e DISABLE_AUTH=true --name rstudio-micca \
    -v /Users/davide/micca:/home/rstudio/micca \
    rstudio-micca
```

