include ../../Library/GNU.mk

Title=		GNU Aspell IT Dictionary
Name=		aspell6-it
Version=	2.2_20050523-0
Site=		ftp://ftp.gnu.org/gnu/aspell/dict/it/
Source=		ftp://ftp.gnu.org/gnu/aspell/dict/it/$(Name)-$(Version).tar.bz2
License=        GPL
LicenseFile=	$(BuildDir)/Copyright

define build_hook
cd $(BuildDir); ./configure; make
endef

