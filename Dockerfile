FROM adoptopenjdk:latest
CMD zsh --login

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
apt-get update && apt-get install -y bsdmainutils git vim zsh && \
rm -rf /var/lib/apt/lists/ && \
sed -i 's/bash$/zsh/g' /etc/passwd /etc/adduser.conf && \
addgroup --gid $GID $GROUP && \
adduser --disabled-password --gecos '' --uid $UID --gid $GID $USER && \
mkdir -p /usr/share/maven && \
curl -fsSL http://apache.osuosl.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz | \
tar -xzC /usr/share/maven --strip-components=1 && \
ln -s /usr/share/maven/bin/mvn /usr/bin/mvn && \
mkdir -p /usr/share/java-deps && \
curl -fsSL -o /usr/share/java-deps/google-java-format-1.7-all-deps.jar \
https://github.com/google/google-java-format/releases/download/google-java-format-1.7/google-java-format-1.7-all-deps.jar

USER $USER
RUN vim +PlugInstall +qall && \
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended && \
git clone https://github.com/reobin/typewritten.git $HOME/.oh-my-zsh/custom/themes/typewritten && \
ln -s $HOME/.oh-my-zsh/custom/themes/typewritten/typewritten.zsh-theme $HOME/.oh-my-zsh/custom/themes/typewritten.zsh-theme && \
sed -i -E 's/^(ZSH_THEME=).*$/\1"typewritten"/g' $HOME/.zshrc && \
sed -i -E 's/^(plugins=).*$/\1\(git mvn vi-mode z\)/g' $HOME/.zshrc
USER root

