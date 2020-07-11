FROM adoptopenjdk:latest
WORKDIR "/root"
CMD bash
ENV MAVEN_HOME /usr/share/maven
ENV MAVEN_CONFIG "$USER_HOME_DIR/.m2"
ENV MAVEN_OPTS="-XX:+TieredCompilation -XX:TieredStopAtLevel=1"
ENV EDITOR=vim
RUN apt update && apt install -y \ 
  bash-completion \
  git \
  vim \
&& \
rm -rf /var/lib/apt/lists/
RUN mkdir -p /usr/share/maven && \
curl -fsSL http://apache.osuosl.org/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.tar.gz | \
tar -xzC /usr/share/maven --strip-components=1 && \
ln -s /usr/share/maven/bin/mvn /usr/bin/mvn && \
mkdir -p "/root/.vim/bundle" && \
git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git "/root/.vim/bundle/Vundle.vim" && \
mkdir -p /usr/share/java-deps && \
curl -fsSL -o /usr/share/java-deps/google-java-format-1.7-all-deps.jar \
https://github.com/google/google-java-format/releases/download/google-java-format-1.7/google-java-format-1.7-all-deps.jar
RUN mv /opt/java/openjdk/bin/java /opt/java/openjdk/bin/java.original
COPY bin/java /opt/java/openjdk/bin/
RUN chmod a+x /opt/java/openjdk/bin/java
COPY .vimrc /root/
RUN vim +PluginInstall +qall
COPY bin/google-java-format /root/bin/
RUN chmod +x /root/bin/*
COPY .bashrc /root/
