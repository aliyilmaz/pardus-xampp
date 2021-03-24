# pardus-xampp

Bu döküman PHP, MYSQL gibi web programlama gereksinimlerini karşılamayı amaçlayan Bitnami XAMPP uygulamasının Pardus işletim sistemine kurulumunu konu almaktadır.

### Pardus'a Bitnami XAMPP nasıl kurulur?

1) [Bu bağlantıyı tıklayın](https://www.apachefriends.org/tr/index.html) karşınıza gelen sayfadan **Linux için XAMPP** seçeneği seçin ve programı indirin.

2) **Uçbirim Öykünücüsü**nü açıp programın indirildiği dizine `cd` komutu yardımıyla ulaşın.

3) Ardından **Uçbirim Öykünücüsü**nde `sudo chmod +x dosyaadi.run` komutunu çalıştırarak program dosyasına çalıştırma izni tanımlayın.

4) Son olarak **Uçbirim Öykünücüsü**nde `./dosyaadi.run` diyerek programın kurulum işlemini başlatın.

**Bilgi** dosyaadi.run kısmını indirdiğiniz programın adı ve uzantısıyla güncellemeniz gerekmektedir. XAMPP dosya adı güncel sürüm numarasını barındırdığından dinamiktir, bu nedenle sizin rehberliğinize ihtiyaç duyulmaktadır.

---


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


2) **Uçbirim Öykünücüsü**nü açıp `sudo mousepad /usr/share/applications/xampp-control-panel.desktop` komutunu çalıştırın, karşınıza gelen mousepad penceresinin içine aşağıdaki kodları yapıştırarak kaydedin ve editörü kapatın

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