dpkg -s oracle-java8-installer &>/dev/null || {
  add-apt-repository -y ppa:webupd8team/java
  echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
  apt-get update && apt-get -y install oracle-java8-installer
}

dpkg -s elasticsearch &>/dev/null || {
  wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
  echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-2.x.list
  apt-get update && sudo apt-get -y install elasticsearch
  mkdir -p /var/data/elasticsearch
  chmod 777 /var/data/elasticsearch
}

