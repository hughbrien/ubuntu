
sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
apt-get update && \
apt-get -y upgrade && \
apt-get install -y build-essential && \
apt-get install -y software-properties-common && \
apt-get install -y byobu curl git htop man unzip vim wget rpm && \
rm -rf /var/lib/apt/lists/*

# Add files.
root/.bashrc /root/.bashrc
root/.gitconfig /root/.gitconfig
root/.scripts /root/.scripts


# passwordless ssh
ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key
ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
ssh-keygen -q -N "" -t rsa -f /root/.ssh/id_rsa
cp /root/.ssh/id_rsa.pub /root/.ssh/authorized_keys

# java

apt-get install -y python-software-properties
add-apt-repository ppa:webupd8team/java
apt-get update
apt-get -y install oracle-java8-installer



mkdir /opt/hadoop
curl -s http://apache.mesi.com.ar/hadoop/common/hadoop-1.2.1/hadoop-1.2.1.tar.gz | tar -xz -C /opt/hadoop
chown -R root /opt/hadoop
cd /opt/hadoop/hadoop-1.2.1
ln -s /opt/hadoop/hadoop-1.2.1 /opt/hadoop/hadoop

cd /
git clone https://github.com/hughbrien/appdynamics-agent.git

git clone https://github.com/hughbrien/docker-hadoop-1.2.1.git
cp docker-hadoop-1.2.1/*xml /opt/hadoop/hadoop/conf
cp /docker-hadoop-1.2.1/hadoop-env.sh  /opt/hadoop/hadoop/conf/
