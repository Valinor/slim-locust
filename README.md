![docker-image workflow](https://github.com/Valinor/slim-locust/actions/workflows/docker-image.yml/badge.svg) [![Snyk Container](https://github.com/Valinor/slim-locust/actions/workflows/snyk-container-analysis.yml/badge.svg)](https://github.com/Valinor/slim-locust/actions/workflows/snyk-container-analysis.yml)

# Slim Locust.io - Locust.io for x64 and arm64 
Slim Locust Image experiment with Locust multi-arch multi-distro 
Origin : https://github.com/Valinor/slim-locust
Latest : Version 2.37.7 - See https://github.com/locustio/locust/tags

## How to use this image
```docker run --rm -it -p 8089:8089 -v "%cd%/locustfile.py:/tmp/locustfile.py" damballa/locust:2.37.7-debian -f /tmp/locustfile.py```

Open your webrowser to [http://localhost:8089](http://localhost:8089)

### Description
Official locust image (https://hub.docker.com/r/locustio/locust) : ~ 263Mo  (87Mo compressed)

For version 2.16.1 of locust
- This locust image debian   : ~203Mo (78Mo compressed)
- This locust image alma     : ~228Mo (99Mo compressed)
- This locust image alpine   : ~61Mo  (23Mo compressed)
- This locust scratch image  : ~27Mo  (25.85Mo compressed)

For version 2.37.6 of locust
- This locust image debian   : ~203Mo (92Mo compressed)
- This locust image alpine   : ~61Mo  (30Mo compressed)
- This locust distroless image  : ~27Mo  (48Mo compressed)

### Be carefull

Python version depend on base image from alpine, debian and fedora
Fedora is pretty long to build for arm architecture

### Vulnerability scan : (docker scan with Snyk)
- Old Offical image : 368 (2.4.3) 46 for 2.12.0
- Offical image : 47 
- Current image for alpine : 1 (from alpine base)
- Current image for redhat : 0
- Current image for debian : 60 (from debian base)

Currently, this image use the latest tag for locust, it is latest.
Latest tag for locust when build was 2.37.7
Use tag to select specific Locust tag (or build specific tag)

Image are push on dockerhub : https://hub.docker.com/repository/docker/damballa/locust

###
Add test with https://github.com/GoogleContainerTools/container-structure-test/
Add default locustfile.py to test the image.