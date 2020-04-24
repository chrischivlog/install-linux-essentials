#!/bin/bash

#update
apt update
echo ""
echo ""
echo "updating all packages"
echo ""
echo ""
sleep 2

#upgrade
apt upgrade -y
echo ""
echo ""
echo "upgrade all packages"
echo ""
echo ""
sleep 2

#install unzip
echo ""
echo "install unzip"
echo ""
apt install unzip



#install java
apt install default-jdk
echo ""
echo ""
echo "install default jdk"
echo ""
echo ""
sleep 2
java -version
sleep 2

#update
apt update -y
echo ""
echo ""
echo "updating all packages"
echo ""
echo ""
sleep 2

#install dependencies for java 
apt install apt-transport-https ca-certificates wget dirmngr gnupg software-properties-common
echo ""
echo ""
echo "install dependencies for java "
echo ""
echo ""
sleep 2

#import gpg for java
wget -qO - https://adoptopenjdk.jfrog.io/adoptopenjdk/api/gpg/key/public | sudo apt-key add -
echo ""
echo ""
echo "import gpg for java"
echo ""
echo ""
sleep 2

#import gpg for java
sudo add-apt-repository --yes https://adoptopenjdk.jfrog.io/adoptopenjdk/deb/
echo ""
echo ""
echo "add repo jfrog for java"
echo ""
echo ""
sleep 2

#update
apt update
echo ""
echo ""
echo "updating all packages"
echo ""
echo ""
sleep 2

#install java 8
apt install adoptopenjdk-8-hotspot
echo ""
echo ""
echo "install java 8"
echo ""
echo ""
sleep 2

#show version
java -version
sleep 2

#show config
echo ""
echo ""
echo ""
echo "##################"
echo "PLEAS CHANGE YOUR DEFAULT JAVA VERSION! to JAVA 1.8"
echo "##################"
echo ""
echo ""
echo ""
sleep 10
update-alternatives --config java

#show great
echo ""
echo ""
echo ""
echo "##################"
echo "GREAT"
echo "##################"
echo ""
echo ""
echo ""
sleep 5
clear

#install webserver
apt install ca-certificates apt-transport-https lsb-release gnupg curl nano unzip -y

#update
apt update
echo ""
echo ""
echo "updating all packages"
echo ""
echo ""
sleep 2

#add php
echo ""
echo "add php package"
echo ""
wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add -
sleep 2


#add package
echo ""
echo "add another php package"
echo ""
echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
sleep 2

#package source
echo ""
echo "add package source"
echo ""
apt install software-properties-common -y
sleep 2

#add package php
echo ""
echo "add package php"
echo ""
add-apt-repository ppa:ondrej/php
sleep 2

#update
apt update
echo ""
echo ""
echo "updating all packages"
echo ""
echo ""
sleep 2

#install apache2 
echo ""
echo "install apache2 "
echo ""
apt install apache2 -y
sleep 2

# install latest php version
echo ""
echo "install php7.4 "
echo ""
apt install php7.4 php7.4-cli php7.4-curl php7.4-gd php7.4-intl php7.4-json php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-readline php7.4-xml php7.4-xsl php7.4-zip php7.4-bz2 libapache2-mod-php7.4 -y
sleep 2

#install mariadb
echo ""
echo "install mariadb"
echo ""
apt install mariadb-server mariadb-client -y
sleep 2
echo ""
echo "setup mariadb"
echo ""
mysql_secure_installation
sleep 2

#install phpmyadmin
echo ""
echo "install phpmyadmin"
echo ""
cd /usr/share
wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.zip -O phpmyadmin.zip
unzip phpmyadmin.zip
rm phpmyadmin.zip
mv phpMyAdmin-*-all-languages phpmyadmin
chmod -R 0755 phpmyadmin
sleep 2


echo "!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "PLEASE COPY DOWN BELOW"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
echo "# phpMyAdmin Apache configuration

Alias /phpmyadmin /usr/share/phpmyadmin

<Directory /usr/share/phpmyadmin>
    Options SymLinksIfOwnerMatch
    DirectoryIndex index.php
</Directory>

# Disallow web access to directories that don't need it
<Directory /usr/share/phpmyadmin/templates>
    Require all denied
</Directory>
<Directory /usr/share/phpmyadmin/libraries>
    Require all denied
</Directory>
<Directory /usr/share/phpmyadmin/setup/lib>
    Require all denied
</Directory>"
echo ""
sleep 20

echo "!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "insert copied now"
nano /etc/apache2/conf-available/phpmyadmin.conf
sleep 2

#enable apache phpmyadmin
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "enable apache phpmyadmin"

a2enconf phpmyadmin
systemctl reload apache2
mkdir /usr/share/phpmyadmin/tmp/
chown -R www-data:www-data /usr/share/phpmyadmin/tmp/
sleep 2

#to access db via root
echo ""
echo "if you wish to access the mariadb via root read this tutorial"
echo "https://www.bennetrichter.de/anleitungen/apache2-php7-mariadb-phpmyadmin/"
echo ""
sleep 10

###clear
clear
echo "cleared"
sleep 5

#install postfix
echo ""
echo "install postfix and sendmail"
echo ""
sleep 3
apt update
apt install mailutils
apt install postfix
sleep 5