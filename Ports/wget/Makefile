BuildRequires += $(LibDir)/libintl.la

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	Retrieve files from the web via HTTP, HTTPS and FTP
Site=		http://www.gnu.org/software/wget/
License=	GPL
Title=		GNU Wget
Name=		wget
Version=	1.13.4
Revision=	0
URL=		http://ftp.gnu.org/gnu/wget/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

GnuConfigureExtra += --with-ssl=openssl

define install_post_hook
mv $(InstallDir)/$(Prefix)/etc/wgetrc $(InstallDir)/$(Prefix)/etc/wgetrc.default
endef
