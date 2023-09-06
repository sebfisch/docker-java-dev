# A Docker container for Java development

This repository provides a docker container for Java development.
The container uses a Docker image from [Adoptium] and installs [Maven] on top of it.

[Adoptium]: https://adoptium.net/temurin/releases/
[Maven]: https://maven.apache.org/

When building the container a non-root user is created that can be used to develop in it.
To avoid permission issues when mounting local files to a container volume,
you can adjust the build args `UID` and `GID`
to reflect your local setup.
Other possible arguments are `JAVA_VERSION=20` and `MAVEN#_VERISON=3.9.4`.

[CC BY 4.0](https://creativecommons.org/licenses/by/4.0/)
