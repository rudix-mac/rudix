include ../../Library/GNU.mk

Title=		GNU Aspell DE (Alte Rechtschreibung) Dictionary
Name=		aspell6-de-alt
Version=	2.1-1
Site=		$(GnuMirror)/aspell/dict/de-alt/
Source=		$(GnuMirror)/aspell/dict/de-alt/$(Name)-$(Version).tar.bz2
License=        GPL
LicenseFile=	$(BuildDir)/Copyright

define build_hook
cd $(BuildDir); ./configure; make
endef

