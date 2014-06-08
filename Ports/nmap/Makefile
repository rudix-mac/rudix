include ../../Library/GNU.mk

Title=		Nmap
Name=		nmap
Version=	6.01
Revision=	1
Site=		http://nmap.org/
URL=		http://nmap.org/dist/
Source=		$(Name)-$(Version).tar.bz2
License=	GPL

ReadMeFile=	$(SourceDir)/HACKING

GnuConfigureExtra += --without-zenmap

define install_post_hook
install -m 644 $(SourceDir)/docs/*.txt $(InstallDir)/$(DocDir)/$(Name)
endef

define test_inner_hook
$(BinDir)/nmap localhost
endef
