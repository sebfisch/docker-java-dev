ARG JAVA_VERSION=20
FROM eclipse-temurin:$JAVA_VERSION
CMD zsh --login

ARG MAVEN3_VERSION=3.9.4

ENV USER=me
ENV GROUP=me
ENV HOME=/home/$USER
ARG UID=1000
ENV UID=$UID
ARG GID=1000
ENV GID=$GID

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$HOME/.m2"
ENV MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1"

RUN chmod a+x /opt/java/openjdk/bin/java && \
  apt-get update && \
  apt-get install -y bsdmainutils git htop libxrender1 libxtst6 libxi6 && \
  rm -rf /var/lib/apt/lists/ && \
  addgroup --gid $GID $GROUP && \
  adduser --disabled-password --gecos '' --uid $UID --gid $GID $USER && \
  mkdir -p /usr/share/maven && \
  curl -fsSL http://apache.osuosl.org/maven/maven-3/${MAVEN3_VERSION}/binaries/apache-maven-${MAVEN3_VERSION}-bin.tar.gz | \
  tar -xzC /usr/share/maven --strip-components=1 && \
  ln -s /usr/share/maven/bin/mvn /usr/bin/mvn
