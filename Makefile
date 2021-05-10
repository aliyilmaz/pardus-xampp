
all: src/xampp-control-panel.desktop src/xampp.policy

install: src/xampp-control-panel.desktop src/xampp.policy
	install -c -m 644 src/xampp-control-panel.desktop $(DESTDIR)/usr/share/applications
	install -c -m 644 src/xampp.policy $(DESTDIR)/usr/share/polkit-1/actions
	ln -s /opt/lampp/bin/php $(DESTDIR)/usr/bin/php	
	wget -O composer-setup.php https://getcomposer.org/installer
	php ./composer-setup.php --install-dir=$(DESTDIR)/usr/local/bin --filename=composer
	chmod -R 0777 /opt/lampp/htdocs || true
