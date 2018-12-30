include ../../Library/GNU.mk

Title=		GNU Aspell DE Dictionary
Name=		aspell6-de
Version=	20030222-1
Site=		ftp://ftp.gnu.org/gnu/aspell/dict/de/
Source=		ftp://ftp.gnu.org/gnu/aspell/dict/de/$(Name)-$(Version).tar.bz2
License=        GPL
LicenseFile=	$(BuildDir)/Copyright

define build_hook
cd $(BuildDir); ./configure; make
endef

