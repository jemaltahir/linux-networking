root@localhost:~# cat traccar_install.sh 
#!/bin/bash

set -e

echo "Updating system..."
sudo apt-get update
sudo apt-get upgrade -y

echo "Installing dependencies..."
sudo apt-get install wget net-tools unzip default-jre mysql-server expect -y

read -sp "Enter MySQL root password: " MYSQL_ROOT_PASSWORD
read -sp "Enter new database name: " DB_NAME
read -sp "Enter new MySQL username: " MYSQL_USER
read -sp "Enter new MySQL user password: " MYSQL_USER_PASSWORD

setup_database() {
    SQL_QUERY="CREATE DATABASE IF NOT EXISTS ${DB_NAME};
    CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'localhost' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';
    GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${MYSQL_USER}'@'localhost';"

    echo "Setting up database..."
    echo $SQL_QUERY | sudo mysql -u root -p${MYSQL_ROOT_PASSWORD}
}

setup_database

echo "Moving to /opt directory..."
cd /opt

echo "Downloading Traccar..."
sudo wget https://github.com/traccar/traccar/releases/download/v5.8/traccar-linux-64-5.8.zip

echo "Installing Traccar..."
sudo unzip traccar-linux-64-5.8.zip && sudo ./traccar.run

echo "Configuring Traccar..."
sudo bash -c "cat > /opt/traccar/conf/traccar.xml" << EOF
<?xml version='1.0' encoding='UTF-8'?>

<!DOCTYPE properties SYSTEM 'http://java.sun.com/dtd/properties.dtd'>

<properties>

    <entry key="config.default">./conf/default.xml</entry>
    <entry key='web.port'>80</entry>

    <entry key='database.driver'>com.mysql.cj.jdbc.Driver</entry>
    <entry key='database.url'>jdbc:mysql://localhost/${DB_NAME}?allowPublicKeyRetrieval=true&amp;useSSL=false&amp;serverTimezone=UTC&amp;useSSL=false&amp;allowMultiQueries=true&amp;autoReconnect=true&amp;useUnicode=yes&amp;characterEncoding=UTF-8&amp;sessionVariables=sql_mode=''</entry>
    <entry key='database.user'>${MYSQL_USER}</entry>
    <entry key='database.password'>${MYSQL_USER_PASSWORD}</entry>

</properties>
EOF

echo "Starting Traccar..."
sudo service traccar start

clear
echo "You can login via the following IP address to your Traccar platform with the following login info:"
IP_ADDRESS=$(ip -4 addr show eth0 | grep -oP '(?<=inet\s)\d+(\.\d+){3}')
echo "IP Address: $IP_ADDRESS"
echo "Email: admin"
echo "Password: admin"
echo "Hello Traccar from $IP_ADDRESS"
root@localhost:~# 

