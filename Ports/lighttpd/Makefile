BuildRequires += $(BinDir)/pcre-config # static-pcre
BuildRequires += $(LibDir)/libev.la # static-libev

include ../../Library/GNU.mk

Title=		Lighttpd
Name=		lighttpd
Version=	1.4.36
Site=		http://www.lighttpd.net
Source=		http://download.lighttpd.net/lighttpd/releases-1.4.x/$(Name)-$(Version).tar.xz
License=	BSD

GnuConfigureExtra += --with-pcre
GnuConfigureExtra += --with-libev
GnuConfigureExtra += --with-openssl
GnuConfigureExtra += --libdir=$(LibDir)/lighttpd

define after_install_hook
install -d $(DestDir)$(SysConfDir)/lighttpd
install -m 644 lighttpd.conf.default $(DestDir)$(SysConfDir)/lighttpd
install -d $(DestDir)$(LocalStateDir)/{www/lighttpd,log/lighttpd,run}
endef

define test_hook
$(SBinDir)/lighttpd -V | grep "$(Version).*(ssl)"
endef

define before_pkg_hook
@echo "root required: $(DestDir)$(LocalStateDir)/log/lighttpd must be set to _www:_www"
sudo chown _www:_www $(DestDir)$(LocalStateDir)/log/lighttpd
@echo "root required: $(DestDir)$(LocalStateDir)/www/lighttpd must be set to _www:_www and g+s"
sudo chown _www:_www $(DestDir)$(LocalStateDir)/www/lighttpd
sudo chmod g+s $(DestDir)$(LocalStateDir)/www/lighttpd
endef
