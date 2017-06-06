sudo wget http://mirrors.163.com/.help/sources.list.trusty -O /etc/apt/sources.list
sudo apt-get update
sudo apt-get install ubuntu-cloud-keyring
echo "deb http://ubuntu-cloud.archive.canonical.com/ubuntu trusty-updates/kilo main" | sudo tee -a /etc/apt/sources.list.d/cloudarchive-kilo.list
echo 'cat'
cat /etc/apt/sources.list.d/cloudarchive-kilo.list
sudo apt-get install -y crudini curl
sudo apt-get install -y ntp

MYSQL_ROOT_PASS=rootpass
echo "mysql-server-5.5 mysql-server/root_password password $MYSQL_ROOT_PASS" | sudo debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password_again password $MYSQL_ROOT_PASS" | sudo debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password seen true" | sudo debconf-set-selections
echo "mysql-server-5.5 mysql-server/root_password_again seen true" | sudo debconf-set-selections

sudo apt-get install -y mysql-server python-mysqldb
