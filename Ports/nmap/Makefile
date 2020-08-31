include ../../Library/GNU.mk

Title=		Nmap
Name=		nmap
Version=	7.80
Site=		http://nmap.org/
Source=		http://nmap.org/dist//$(Name)-$(Version).tar.bz2
License=	GPL

ReadMeFile=	$(SourceDir)/HACKING

GnuConfigureExtra += --without-zenmap
GnuConfigureExtra += --without-ncat
GnuConfigureExtra += --with-liblua=included
GnuConfigureExtra += --with-localdirs

define after_install_hook
install -m 644 $(SourceDir)/docs/*.txt $(InstallDir)/$(DocDir)/$(Name)
endef

define test_hook
$(BinDir)/nmap localhost
endef
