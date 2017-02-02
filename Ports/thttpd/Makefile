include ../../Library/GNU.mk

Title=		Tiny/turbo/throttling HTTP server
Name=		thttpd
Version=	2.26
Site=		http://www.acme.com/software/thttpd/
Source=		http://www.acme.com/software/thttpd/thttpd-$(Version).tar.gz
License=        BSD

LicenseFile=	LICENSE

GnuConfigureExtra += i386-unknown-freebsd
GnuConfigureExtra += --mandir=$(ManDir)

define install_pre_hook
mkdir -p $(DestDir)$(ManDir)/man1
endef

define pkg_pre_hook
@echo "root required: $(DestDir)$(LocalStateDir)/www/thttpd must be set to _www:_www and g+s"
sudo chown _www:_www $(DestDir)$(LocalStateDir)/www/thttpd
sudo chown _www:_www $(DestDir)$(LocalStateDir)/www/thttpd/cgi-bin
sudo chmod g+s $(DestDir)$(LocalStateDir)/www/thttpd
sudo chmod g+s $(DestDir)$(LocalStateDir)/www/thttpd/cgi-bin
@echo "root required: $(DestDir)$(BinDir)/makeweb must be set to root:_www and 2755"
sudo chown root:_www $(DestDir)$(BinDir)/makeweb
sudo chmod 2755 $(DestDir)$(BinDir)/makeweb
endef

define test_hook
$(BinDir)/thttpd -V | grep $(Version)
endef
