ARG JAVA_VERSION=11
FROM adoptopenjdk:$JAVA_VERSION
CMD zsh --login

ARG MAVEN3_VERSION=3.6.3

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
ENV EDITOR=vim

RUN rm -rf /etc/skel/.bash* /etc/skel/.profile && \
  mv /opt/java/openjdk/bin/java /opt/java/openjdk/bin/java.original
COPY skel/* /etc/skel/
COPY bin/java /opt/java/openjdk/bin/
COPY bin/google-java-format /usr/local/bin/
RUN chmod a+x /opt/java/openjdk/bin/java && \
  chmod +x /usr/local/bin/google-java-format && \
  apt-get update && \
  apt-get install -y bsdmainutils git vim zsh tmux fzf ripgrep curl htop libxrender1 libxtst6 libxi6 && \
  rm -rf /var/lib/apt/lists/ && \
  curl -sfL git.io/antibody | sh -s - -b /usr/local/bin && \
  sed -i 's/bash$/zsh/g' /etc/passwd /etc/adduser.conf && \
  addgroup --gid $GID $GROUP && \
  adduser --disabled-password --gecos '' --uid $UID --gid $GID $USER && \
  mkdir -p /usr/share/maven && \
  curl -fsSL http://apache.osuosl.org/maven/maven-3/${MAVEN3_VERSION}/binaries/apache-maven-${MAVEN3_VERSION}-bin.tar.gz | \
  tar -xzC /usr/share/maven --strip-components=1 && \
  ln -s /usr/share/maven/bin/mvn /usr/bin/mvn && \
  mkdir -p /usr/share/java-deps && \
  curl -fsSL -o /usr/share/java-deps/google-java-format-1.7-all-deps.jar \
  https://github.com/google/google-java-format/releases/download/google-java-format-1.7/google-java-format-1.7-all-deps.jar

USER $USER
RUN vim +PlugInstall +qall && \
  sed -i 's/delek/monokai_pro/g' $HOME/.vimrc && \
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm && \
  $HOME/.tmux/plugins/tpm/bin/install_plugins
