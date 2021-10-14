# docker-collection
Some dockerfile personnal template alternative to official docker images

## Non official slim Locust.io

### Description
- Official locust image (https://hub.docker.com/r/locustio/locust) : ~ 950Mo
- This locust image debian : ~203Mo
- This locust image redhat : ~271Mo
- This locust image fedora : ~236Mo
- This locust image alpine : ~87Mo

### Be carefull
- Offical image use Python 3.8
- The debian base image use Python 3.7 (official debian python3 package)
- The redhat base image use Python 3.8
- The alpine base image use Python 3.9

### Vulnerability scan : (docker scan)
- Offical image : 368
- Current image for debian : 72 (vulnerability in debian buster)
- Current image for alpine : 0
- Current image for redhat : 0


Currently, this image use the latest tag for locust, it is latest.
Latest tag for locust when build was 2.4.0
Use branch to select specific Locust tag 
