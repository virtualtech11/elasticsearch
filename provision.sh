dpkg -s oracle-java8-installer &>/dev/null || {
  add-apt-repository -y ppa:webupd8team/java
  echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
  apt-get update && apt-get -y install oracle-java8-installer
}
