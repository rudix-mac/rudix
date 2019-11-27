include ../../Library/GNU.mk

Title=		GNU Aspell EN Dictionary
Name=		aspell6-en
Version=	2019.10.06-0
Site=		$(GnuMirror)/aspell/dict/en/
Source=		$(GnuMirror)/aspell/dict/en/$(Name)-$(Version).tar.bz2
License=        GPL
LicenseFile=	$(BuildDir)/Copyright

define build_hook
cd $(BuildDir); ./configure; make
endef

BuildRequires += $(BinDir)/aspell
