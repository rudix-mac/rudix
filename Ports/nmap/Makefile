include ../../Library/GNU.mk

Title=		Nmap
Name=		nmap
Version=	6.01
Revision=	0
URL=		http://nmap.org/dist/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/HACKING
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --without-zenmap

define install_post_hook
install -m 644 $(SourceDir)/docs/*.txt $(InstallDir)/$(DocDir)/$(Name)
endef

define final_inner_hook
$(BinDir)/nmap localhost
endef
