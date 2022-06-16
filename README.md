![docker-image workflow](https://github.com/Valinor/slim-locust/actions/workflows/docker-image.yml/badge.svg) [![Snyk Container](https://github.com/Valinor/slim-locust/actions/workflows/snyk-container-analysis.yml/badge.svg)](https://github.com/Valinor/slim-locust/actions/workflows/snyk-container-analysis.yml)

# Slim Locust.io 
Slim Locust Image experiment with Locust 2.4.3 and multi-arch multi-distro 

/!\ Currently, problem with fedora latest (see https://medium.com/nttlabs/ubuntu-21-10-and-fedora-35-do-not-work-on-docker-20-10-9-1cd439d9921 )
Will be corrected when docker will be upgraded

### Description
- Official Old locust image (https://hub.docker.com/r/locustio/locust) : ~ 950Mo
For version 2.5.0 of locust
- This locust image debian   : ~203Mo
- This locust image redhat   : ~271Mo
- This locust image fedora   : ~236Mo
- This locust layered alpine : ~103Mo
- This locust image alpine   : ~57Mo

For version 2.9.0 of locust
- This locust image debian   : ~203Mo
- This locust image redhat   : ~276Mo
- This locust image fedora   : ~228Mo
- This locust layered alpine : ~108Mo
- This locust image alpine   : ~60.4Mo


### Be carefull
- The debian base image use Python 3.9 (official debian python3 package)
- The redhat ubi base image use Python 3.6.8
- The fedora ubi base image use Python 3.10
- The alpine base image use Python 3.10

### Vulnerability scan : (docker scan)
- Old Offical image : 368
- Current image for debian : 72 (vulnerability in debian buster)
- Current image for alpine : 0
- Current image for redhat : 0


Currently, this image use the latest tag for locust, it is latest.
Latest tag for locust when build was 2.4.3
Use branch to select specific Locust tag

Image are push on dockerhub : https://hub.docker.com/repository/docker/damballa/locust


###
Add test with https://github.com/GoogleContainerTools/container-structure-test/
