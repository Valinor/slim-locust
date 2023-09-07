![docker-image workflow](https://github.com/Valinor/slim-locust/actions/workflows/docker-image.yml/badge.svg) [![Snyk Container](https://github.com/Valinor/slim-locust/actions/workflows/snyk-container-analysis.yml/badge.svg)](https://github.com/Valinor/slim-locust/actions/workflows/snyk-container-analysis.yml)

# Slim Locust.io - Locust.io for x64 and arm64 
Slim Locust Image experiment with Locust multi-arch multi-distro 
Origin : https://github.com/Valinor/slim-locust
Latest : Version 2.16.1 - See https://github.com/locustio/locust/tags

### Description
Official locust image (https://hub.docker.com/r/locustio/locust) : ~ 263Mo  (87Mo compressed)

For version 2.16.1 of locust
- This locust image debian   : ~203Mo (78Mo compressed)
- This locust image fedora   : ~228Mo (99Mo compressed)
- This locust image alpine   : ~61Mo  (23.45Mo compressed)


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
Latest tag for locust when build was 2.16.1
Use tag to select specific Locust tag (or build specific tag)

Image are push on dockerhub : https://hub.docker.com/repository/docker/damballa/locust

###
Add test with https://github.com/GoogleContainerTools/container-structure-test/
