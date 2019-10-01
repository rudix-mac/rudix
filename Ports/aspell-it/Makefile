include ../../Library/GNU.mk

Title=		GNU Aspell IT Dictionary
Name=		aspell6-it
Version=	2.2_20050523-0
Site=		$(GnuMirror)/aspell/dict/it/
Source=		$(GnuMirror)/aspell/dict/it/$(Name)-$(Version).tar.bz2
License=        GPL
LicenseFile=	$(BuildDir)/Copyright

define build_hook
cd $(BuildDir); ./configure; make
endef

