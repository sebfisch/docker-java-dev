FROM adoptopenjdk:latest
CMD bash

ARG HOME
ENV HOME=$HOME
ARG USER
ENV USER=$USER
ARG UID
ENV UID=$UID
ARG GROUP
ENV GROUP=$GROUP
ARG GID
ENV GID=$GID

RUN addgroup --gid $GID $GROUP && \
adduser --disabled-password --gecos '' --uid $UID --gid $GID $USER

ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$HOME/.m2"
ENV MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1"
ENV EDITOR=vim

RUN apt-get update && apt-get install -y \ 
  bash-completion \
  git \
  vim \
&& \
rm -rf /var/lib/apt/lists/

RUN mkdir -p /usr/share/maven && \
curl -fsSL http://apache.osuosl.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz | \
tar -xzC /usr/share/maven --strip-components=1 && \
ln -s /usr/share/maven/bin/mvn /usr/bin/mvn && \
mkdir -p /usr/share/java-deps && \
curl -fsSL -o /usr/share/java-deps/google-java-format-1.7-all-deps.jar \
https://github.com/google/google-java-format/releases/download/google-java-format-1.7/google-java-format-1.7-all-deps.jar

RUN mv /opt/java/openjdk/bin/java /opt/java/openjdk/bin/java.original
COPY bin/java /opt/java/openjdk/bin/
RUN chmod a+x /opt/java/openjdk/bin/java

COPY --chown=$USER:$GROUP .vimrc "$HOME/"
USER $USER
RUN vim +PlugInstall +qall
USER root

COPY --chown=$USER:$GROUP bin/google-java-format "$HOME/bin/"
RUN chmod +x "$HOME/bin/google-java-format"

COPY --chown=$USER:$GROUP .bashrc "$HOME/"

