include ../../Library/GNU.mk

Title=		Nmap
Name=		nmap
Version=	6.40
Site=		http://nmap.org/
Source=		http://nmap.org/dist//$(Name)-$(Version).tar.bz2
License=	GPL

ReadMeFile=	$(SourceDir)/HACKING

GnuConfigureExtra += --without-zenmap

define after_install_hook
install -m 644 $(SourceDir)/docs/*.txt $(InstallDir)/$(DocDir)/$(Name)
endef

define test_hook
$(BinDir)/nmap localhost
endef
