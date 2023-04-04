#!/bin/bash

# ********************************************* #
# Script para configurar servidor web con preact, java y postgres
# ********************************************* #

# <--------------------------> #
echo -e "\e[32mInstalando dependencias...\e[0m"

apt-get update
apt-get install -y docker.io
apt-get install -y docker-compose
apt-get install -y neofetch
apt-get install -y postgresql-client 

echo -e "\e[32mDependencias instaladas. 🚀\e[0m"
# <--------------------------> #

# <--------------------------> #
echo -e "\e[32mCreando usuarios y grupos...\e[0m"

useradd frontend
useradd backend
useradd dbadmin
useradd sysadmin

usermod -d /home/frontend -s /bin/bash frontend
usermod -d /home/backend -s /bin/bash backend
usermod -d /home/dbadmin -s /bin/bash dbadmin
usermod -d /home/sysadmin -s /bin/bash sysadmin

echo "frontend:frontend" | chpasswd
echo "backend:backend" | chpasswd
echo "dbadmin:dbadmin" | chpasswd
echo "sysadmin:sysadmin" | chpasswd

groupadd frontend-group
groupadd backend-group
groupadd dbadmin-group

usermod -a -G frontend-group frontend
usermod -a -G backend-group backend
usermod -a -G dbadmin-group dbadmin

echo -e "\e[32mUsuarios y grupos creados. 🚀\e[0m"
# <--------------------------> #


# <--------------------------> #
echo -e "\e[32mCreando directorios y asignando permisos...\e[0m"

mkdir /var/www
mkdir /var/www/frontend
mkdir /var/www/backend
mkdir /var/db

mkdir /backupdb
mkdir /home/frontend
mkdir /home/backend
mkdir /home/dbadmin
mkdir /home/sysadmin

chown -R root:frontend-group /var/www/frontend
chown -R root:backend-group /var/www/backend
chown -R root:dbadmin-group /var/db


chown -R frontend:frontend-group /home/frontend
chown -R backend:backend-group /home/backend
chown -R dbadmin:dbadmin-group /home/dbadmin
chown -R sysadmin:sysadmin /home/sysadmin

chmod 770 /var/www/frontend
chmod 770 /var/www/backend
chmod 770 /var/db

usermod -aG docker sysadmin

chown dbadmin /usr/bin/psql
chmod 500 /usr/bin/psql

echo "echo -e '\e[32mWelcome to the server\e[0m'" >> /home/frontend/.bash_profile
echo "clear" >> /home/frontend/.bash_profile
echo "neofetch" >> /home/frontend/.bash_profile
echo "echo -e '\e[32mWelcome to the server\e[0m'" >> /home/backend/.bash_profile
echo "clear" >> /home/backend/.bash_profile
echo "neofetch" >> /home/backend/.bash_profile
echo "echo -e '\e[32mWelcome to the server\e[0m'" >> /home/dbadmin/.bash_profile
echo "clear" >> /home/dbadmin/.bash_profile
echo "neofetch" >> /home/dbadmin/.bash_profile
echo "echo -e '\e[32mWelcome to the server\e[0m'" >> /home/sysadmin/.bash_profile
echo "clear" >> /home/sysadmin/.bash_profile
echo "neofetch" >> /home/sysadmin/.bash_profile

echo "echo -e '\e[32mWelcome to the server\e[0m'" >> /home/frontend/.bashrc
echo "clear" >> /home/frontend/.bashrc
echo "neofetch" >> /home/frontend/.bashrc
echo "echo -e '\e[32mWelcome to the server\e[0m'" >> /home/backend/.bashrc
echo "clear" >> /home/backend/.bashrc
echo "neofetch" >> /home/backend/.bashrc
echo "echo -e '\e[32mWelcome to the server\e[0m'" >> /home/dbadmin/.bashrc
echo "clear" >> /home/dbadmin/.bashrc
echo "neofetch" >> /home/dbadmin/.bashrc
echo "echo -e '\e[32mWelcome to the server\e[0m'" >> /home/sysadmin/.bashrc
echo "clear" >> /home/sysadmin/.bashrc
echo "neofetch" >> /home/sysadmin/.bashrc

echo -e "\e[32mDirectorios y permisos creados. 🚀\e[0m"
# <--------------------------> #

# <--------------------------> #
echo -e "\e[32mConfigurando firewall...\e[0m"

ufw enable
ufw allow ssh
ufw allow http
ufw allow https

echo -e "\e[32mFirewall configurado. 🚀\e[0m"
# <--------------------------> #

# <--------------------------> #
echo -e "\e[32mConfigurando cron...\e[0m"
# backup cadda minuto
echo "* * * * * root tar -czf /backupdb/backupdb.tar.gz /var/db" >> /etc/crontab
echo -e "\e[32mCron configurado. 🚀\e[0m"
# <--------------------------> #

# <--------------------------> #
echo -e "\e[32mIniciando servidor web...\e[0m"
cp -r frontend/* /var/www/frontend/
cp -r backend/* /var/www/backend/
cp .env.example .env
docker-compose up -d
echo -e "\e[32mServidor web iniciado. 🚀\e[0m"
# <--------------------------> #

echo -e "\e[34m[ CONFIGURACION FINALIZADA ] ✨\e[0m"
echo -e "\e[31mCambiar la contraseña de los usuarios\e[0m"

