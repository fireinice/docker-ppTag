# ppTag-docker

Plex Photo Tagger Docker Image with python3-alpine base image

**All codes credits go to arehbein/pptag, this image only reduce the disk usage from 900M to 50M**

## Intro

As the plex server is not compatible with xmp metadata inside photos, this python based app uses plex rest api to implement an update of all related metadata within plex with tags and rating of the xmp


## How to use:

Please refer to https://github.com/arehbein-git/ppTag


## Docker Container

The container needs one volume for the photos:

```
<path to photolibrary>:/Photos
```

The config file should be mounted as readonly:

```
<path to config>/config.py:/app/pptag/config.py:ro
```

config.py can be found in https://raw.githubusercontent.com/arehbein-git/ppTag/master/config.py


```bash
docker run -v <path to photolibrary>:/Photos -v <path to config>/config.py:/app/pptag/config.py:ro -d arehbein/pptag
```

## Docker Composer
```
  pptag:
    image: fireinice/pptag:latest
    restart: always
    volumes:
      - <path to photolibrary>:/Photos
      - <path to config>/config.py:/app/pptag/config.py:ro
```

```bash
docker-compose up -d
```
