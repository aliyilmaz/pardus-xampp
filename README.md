# pardus-xampp


### xampp çalıştırma simgesi nasıl oluşturulur?

Bu döküman PHP, MYSQL gibi web programlama gereksinimlerini karşılamayı amaçlayan Bitnami XAMPP uygulaması için çalıştırma simgesi oluşturmayı konu almaktadır.

Dökümanın uygulandığı işletim sistemi, Pardus dağıtımıdır, diğer debian türevlerinde denenmemiştir.

Ayrıca `src` dizininde örnek dosyalar sunulmuştur.


1) **Uçbirim Öykünücüsü**nü açıp `sudo mousepad /usr/share/polkit-1/actions/xampp.policy` komutunu çalıştırın, karşınıza gelen mousepad penceresinin içine aşağıdaki kodları yapıştırarak kaydedin ve editörü kapatın.



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