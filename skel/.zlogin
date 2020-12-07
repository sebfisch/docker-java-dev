if [ -f pom.xml ]; then
  mvn dependency:resolve -Dclassifier=sources
fi
