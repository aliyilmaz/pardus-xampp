# pardus-xampp

Bu döküman PHP, MYSQL gibi web programlama gereksinimlerini karşılamayı amaçlayan Bitnami XAMPP uygulamasının, composer ve php komutlarının Pardus işletim sistemine kurulumunu konu almaktadır.

## Pardus'a Bitnami XAMPP nasıl Kurulur ve Kaldırılır ?

### Kurulum

1) [Bu bağlantıyı tıklayıp](https://github.com/aliyilmaz/pardus-xampp/archive/refs/heads/main.zip) **pardus-xampp** dizinini indirin ve klasöre çıkarın.

2) **Uçbirim Öykünücüsü**nü açıp dosyaların çıkarıldığı dizine `cd` komutu yardımıyla ulaşın.

3) **Uçbirim Öykünücüsü**ndeyken `sudo sh install.sh` komutunu çalıştırarak kurulumu başlatın ve karşınıza gelen kurulum arayüzünü ilerletin, kurulum ekranı kapandığında, diğer tüm ayarlar gerçekleştirilecektir.

### Kaldırma

1) **Uçbirim Öykünücüsü**nü açıp kurulum maddesine konu olan dosyaların çıkarıldığı dizine `cd` komutu yardımıyla ulaşın.

2) **Uçbirim Öykünücüsü**ndeyken `sudo sh uninstall.sh` komutunu çalıştırarak kaldırma işlemini başlatın, ayarlarıyla birlikte tüm kurulum dosyaları kaldırılacaktır.

---

## Pardus'a Bitnami XAMPP başka bir yöntemle nasıl Kurulur ve Kaldırılır ?

### Kurulum

1) [Bu bağlantıyı tıklayın](https://www.apachefriends.org/tr/index.html) karşınıza gelen sayfadan **Linux için XAMPP** seçeneği seçin ve programı indirin.

2) **Uçbirim Öykünücüsü**nü açıp programın indirildiği dizine `cd` komutu yardımıyla ulaşın.

3) Ardından **Uçbirim Öykünücüsü**nde `sudo chmod +x ./xampp-linux-x64-8.0.7-0-installer.run` komutunu çalıştırarak program dosyasına çalıştırma izni tanımlayın.

4) Son olarak **Uçbirim Öykünücüsü**nde `sudo ./xampp-linux-x64-8.0.7-0-installer.run` diyerek programın kurulum işlemini başlatın.

**Bilgi** dosyaadi.run kısmını indirdiğiniz programın adı ve uzantısıyla güncellemeniz gerekmektedir. XAMPP dosya adı güncel sürüm numarasını barındırdığından dinamiktir, bu nedenle sizin rehberliğinize ihtiyaç duyulmaktadır.




### XAMPP çalıştırma simgesi nasıl oluşturulur?

1) **Uçbirim Öykünücüsü**nü açıp `sudo mousepad /usr/share/polkit-1/actions/xampp.policy` komutunu çalıştırın, karşınıza gelen mousepad penceresinin içine aşağıdaki kodları yapıştırarak kaydedin ve editörü kapatın.

##### xampp.policy


    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE policyconfig PUBLIC
    "-//freedesktop//DTD PolicyKit Policy Configuration 1.0//EN"
    "http://www.freedesktop.org/standards/PolicyKit/1/policyconfig.dtd">
    <policyconfig>

    <action id="org.freedesktop.policykit.pkexec.run-xampp">
        <description>Run the Xampp Control Panel</description>
        <message>Authentication is required to run the Xampp Control Panel</message>
        <defaults>
        <allow_any>no</allow_any>
        <allow_inactive>no</allow_inactive>
        <allow_active>auth_admin_keep</allow_active>
        </defaults>
        <annotate key="org.freedesktop.policykit.exec.path">/opt/lampp/manager-linux-x64.run</annotate>
        <annotate key="org.freedesktop.policykit.exec.allow_gui">TRUE</annotate>
    </action>
    </policyconfig>


2) **Uçbirim Öykünücüsü**nü açıp `sudo mousepad /usr/share/applications/xampp-control-panel.desktop` komutunu çalıştırın, karşınıza gelen mousepad penceresinin içine aşağıdaki kodları yapıştırarak kaydedin ve editörü kapatın.

##### xampp-control-panel.desktop


    [Desktop Entry]
    Encoding=UTF-8
    Name=XAMPP Control Panel
    Comment=Start and Stop XAMPP
    Exec=pkexec /opt/lampp/manager-linux-x64.run
    Icon=/opt/lampp/img/bitnami.ico
    Categories=Application
    Type=Application
    Terminal=false

Ayrıca `src` dizininde örnek dosyalar sunulmuştur.



### PHP'nin Uçbirim Öykünücüsünde çalışabilmesi nasıl sağlanır ?

**Uçbirim Öykünücüsü**nü açıp `sudo ln -s /opt/lampp/bin/php /usr/bin/php` komutunu çalıştırın, ardından `php -v` komutunu çalıştırarak PHP'nin sisteme tanımlandığını doğrulayın.



### Composer'ın Uçbirim Öykünücüsünde çalışabilmesi nasıl sağlanır ?

**Uçbirim Öykünücüsünü**nü açıp `sudo wget -O composer-setup.php https://getcomposer.org/installer && sudo  php ./composer-setup.php --install-dir=/usr/local/bin --filename=composer` komutunu çalıştırın, ardından `composer` komutunu çalıştırarak Composer'ın sisteme tanımlandığını doğrulayın.



### PHP dosyalarının barınacağı dizin nasıl kullanılır ?

PHP dosyaları, `/opt/lampp/htdocs` yolunda tutulur. Dosyaları bu yola kopyalamadan önce, bu dizine izin vermek gerekir. İzni vermek için **Uçbirim öykünücüsü**nü açıp, `sudo chmod -R 0777 /opt/lampp/htdocs` komutunu çalıştırın, ardından `htdocs` klasörü içinde bir dosya ya da klasör oluşturmayı deneyerek iznin verildiğini doğrulayın.


### Kaldırma

**Uçbirim Öykünücüsünü**nü açıp sırasıyla aşağıdaki komutları çalıştırarak kaldırma işlemini gerçekleştirin;

    sudo rm -R /opt/lampp
    sudo rm -R /usr/share/polkit-1/actions/xampp.policy
    sudo rm -R /usr/share/applications/xampp-control-panel.desktop
    sudo rm -R /usr/bin/php
    sudo rm -R /usr/local/bin/composer

---

### Lisans
Bu dizinde bulunan yönerge ve dosyalar **GPL3** lisansı altında paylaşılmıştır.

> Copyright (C) 2021, Ali Yılmaz and contributors 
> 
> This program is free software: you can redistribute it and/or modify
> it under the terms of the GNU General Public License as published by
> the Free Software Foundation, either version 3 of the License, or
> (at your option) any later version.
> 
> This program is distributed in the hope that it will be useful,
> but WITHOUT ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> GNU General Public License for more details.
> 
> You should have received a copy of the GNU General Public License
> along with this program.  If not, see <https://www.gnu.org/licenses/>.
