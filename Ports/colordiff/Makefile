include ../../Library/Unix.mk

Title=		ColorDiff
Name=		colordiff
Version=	1.0.16
Site=		http://www.colordiff.org
Source=		http://www.colordiff.org/$(Name)-$(Version).tar.gz
License=	GPL

define after_prep_hook
cd $(BuildDir) ; mv INSTALL _INSTALL
endef

define build_hook
endef

define test_hook
endef

define after_install_hook
mv $(InstallDir)/usr/local/etc/colordiffrc \
	$(InstallDir)/usr/local/etc/colordiffrc.default
endef

define test_hook
$(BinDir)/colordiff -u $(BuildDir)/colordiff.pl $(BinDir)/colordiff || true
endef
