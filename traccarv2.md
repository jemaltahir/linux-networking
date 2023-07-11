
1. **Update & Package Installation:**

The following commands are about updating the system, installing new software packages, and configuring package repositories.

```bash
sudo yum update
sudo yum -y install epel-release
sudo rpm -Uvh http://rpms.remirepo.net/enterprise/remi-release-7.rpm
sudo yum install yum-utils
sudo yum-config-manager --enable remi-php74
sudo yum -y install httpd mariadb-server mariadb unzip wget htop net-tools git nano redis
```

2. **PHP Installation & Configuration:**

These commands are about installing and configuring PHP for your web server.

```bash
sudo yum -y install php74 php74-php php74-php-fpm php74-php-gd php74-php-json php74-php-mbstring php74-php-mysqlnd php74-php-xml php74-php-xmlrpc php74-php-opcache php74-php-redis php74-bcmath
sudo yum clean all
```

3. **MySQL Configuration & Troubleshooting:**

These commands relate to MySQL operations, such as starting the service, creating databases, and troubleshooting issues.

```bash
sudo systemctl start mariadb
sudo systemctl enable mariadb
mysql -u youuser -p -e "create database traccar"
sudo mysqld_safe --skip-grant-tables &
mysql -uroot
sudo killall mysqld
sudo systemctl start mariadb
mysql -uroot -p -e "create database traccar"
```

4. **Web Server (Apache) Configuration & Operations:**

These commands involve starting the web server, enabling it to run at startup, and setting permissions for web directory.

```bash
sudo systemctl start httpd
sudo systemctl enable httpd
sudo chown -R $USER:$USER /var/www/html -> ## N.B this is user specific, if you are running with root no need this step.
```

5. **Composer Installation & Usage:**

Composer is a tool for dependency management in PHP, and these commands are about its installation and use.

```bash
curl -sS https://getcomposer.org/installer | php
sudo curl -sS https://getcomposer.org/installer | php
```

6. **Redis Server Configuration:**

These commands relate to the configuration of Redis server.

```bash
sudo systemctl start redis
sudo systemctl enable redis
```

7. **FTP & Other Services Configuration:**

These commands deal with the installation and configuration of other services like Node.js, FTP server, and Java.

```bash
curl -sL https://rpm.nodesource.com/setup_12.x | sudo bash -
sudo yum install -y nodejs java-1.8.0-openjdk vsftpd ftp quota unzip zip
sudo systemctl start vsftpd
sudo systemctl enable vsftpd
```

8. **Troubleshooting & System Analysis:**

These commands are used for troubleshooting and analysing various aspects of the system such as network and system processes.

```bash
sudo netstat -tuln | grep :80
ps aux | grep mariadb
ps aux | grep mysql
sudo journalctl -xe
nmap -p 1-65535 <server_ip>
```

9. **Application-Specific Operations:**

These commands are about working with specific applications like traccar.

```bash
wget http://207.244.225.51/assets/gpswox_web.sql
mysql -uroot gpswox_web < gpswox_web.sql
wget https://github.com/traccar/traccar/releases/download/v3.5/traccar-linux-64-3.5.zip
sudo systemctl enable traccar
sudo systemctl start traccar
sudo systemctl status traccar
sudo systemctl restart traccar
sudo wget http://167.71.216.19/assets/traccar.zip
sudo systemctl daemon-reload
```

