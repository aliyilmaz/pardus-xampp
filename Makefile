RUN_URL = "https://www.apachefriends.org/xampp-files/8.0.5/xampp-linux-x64-8.0.5-0-installer.run"
RUN_FILE = xampp-linux-x64-8.0.5-0-installer.run
RENAMED_RUN_FILE = xampp-installer.run

all: src/xampp-control-panel.desktop src/xampp.policy setup

setup:
	if ! test -f ; then
	wget $(RUN_URL) || curl -O $(RUN_URL)
	mv $(RUN_FILE) $(RENAMED_RUN_FILE)
	chmod 755 $(RENAMED_RUN_FILE)
	fi

install: src/xampp-control-panel.desktop src/xampp.policy all
	mkdir -p $(DESTDIR)/usr/share/applications $(DESTDIR)/usr/share/polkit-1/actions $(DESTDIR)/usr/bin $(DESTDIR)/usr/local/bin $(DESTDIR)/opt/cache
	install -c -m 644 src/xampp-control-panel.desktop $(DESTDIR)/usr/share/applications
	install -c -m 644 src/xampp.policy $(DESTDIR)/usr/share/polkit-1/actions
	ln -s /opt/lampp/bin/php $(DESTDIR)/usr/bin/php	
	wget -O composer-setup.php https://getcomposer.org/installer
	php ./composer-setup.php --install-dir=$(DESTDIR)/usr/local/bin --filename=composer
	chmod -R 0777 /opt/lampp/htdocs || true

	install -c -m 755 $(RUN_FILE) $(DESTDIR)/opt/cache
