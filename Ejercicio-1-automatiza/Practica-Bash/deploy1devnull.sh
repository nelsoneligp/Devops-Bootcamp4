#!/bin/bash
REPO="devops-static-web"
echo "----------------------"
apt-get update -y
echo "Actualizando....Distro"

if dpkg -s apache2 >/dev/null 2>&1; then
    echo -e "\n\e[96mApache esta realmente instalado \033[0m\n"
else
    echo -e "\n\e[92mInstalando Apache2....\033[0m\n"
    apt install -y apache2
    systemctl start apache2
    systemctl enable apache2
fi

if [ -d "$REPO" ]; then
    echo "El Repo $REPO existe!!"
else
    git clone -b devops-mariobros https://github.com/roxsross/$REPO.git
fi
echo "Instalando Sitio web"
sleep 1
cp -r $REPO/* /var/www/html
