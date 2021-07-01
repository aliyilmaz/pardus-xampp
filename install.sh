#!/bin/bash
# pardus-xampp - install
wget -O src/xampp-linux-x64-8.0.7-0-installer.run https://www.apachefriends.org/xampp-files/8.0.7/xampp-linux-x64-8.0.7-0-installer.run
chmod +x src/xampp-linux-x64-8.0.7-0-installer.run
./src/xampp-linux-x64-8.0.7-0-installer.run
cp -R src/xampp.policy /usr/share/polkit-1/actions/xampp.policy
cp -R src/xampp-control-panel.desktop /usr/share/applications/xampp-control-panel.desktop
ln -s /opt/lampp/bin/php /usr/bin/php
wget -O /opt/lampp/composer-setup.php https://getcomposer.org/installer && sudo php /opt/lampp/composer-setup.php --install-dir=/usr/local/bin --filename=composer
chmod -R 0777 /opt/lampp/htdocs