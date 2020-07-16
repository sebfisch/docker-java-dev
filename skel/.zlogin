TYPEWRITTEN_PROMPT_LAYOUT="singleline_verbose"
if [ -f pom.xml ]; then
  mvn dependency:resolve -Dclassifier=sources
fi
