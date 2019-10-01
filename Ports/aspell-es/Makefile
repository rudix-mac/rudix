include ../../Library/GNU.mk

Title=		GNU Aspell ES Dictionary
Name=		aspell6-es
Version=	1.11-2
Site=		$(GnuMirror)/aspell/dict/es/
Source=		$(GnuMirror)/aspell/dict/es/$(Name)-$(Version).tar.bz2
License=        GPL
LicenseFile=	$(BuildDir)/Copyright

define build_hook
cd $(BuildDir); ./configure; make
endef

