# Nmap bundles with the libraries it requires

# BUG: libdnet won't build as shared library
RUDIX_BUILD_STATIC_LIBS=

include ../../Library/GNU.mk

Title=		Nmap
Name=		nmap
Version=	6.40
Revision=	0
Site=		http://nmap.org/
URL=		http://nmap.org/dist/
Source=		$(Name)-$(Version).tar.bz2
License=	GPL

ReadMeFile=	$(SourceDir)/HACKING

define install_post_hook
install -m 644 $(SourceDir)/docs/*.txt $(InstallDir)/$(DocDir)/$(Name)
endef

define test_inner_hook
$(BinDir)/nmap localhost
endef
