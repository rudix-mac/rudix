RUDIX_ENABLE_NLS=yes

# FIXME: How to compile it static with the new buildsystem?
#ifdef WITH_STATIC_NLS
#LDFLAGS+=	-framework CoreFoundation -liconv
#endif

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Site=		http://www.gnu.org/software/wget/
License=	GPL
Description=	Retrieve files from the web via HTTP, HTTPS and FTP
Title=		GNU Wget $(Version)
Name=		wget
Version=	1.12
Revision=	1
URL=		http://ftp.gnu.org/gnu/wget/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(BuildDir)/README
LicenseFile=	$(BuildDir)/COPYING

define install_post_hook
mv $(InstallDir)/$(Prefix)/etc/wgetrc $(InstallDir)/$(Prefix)/etc/wgetrc.default
endef
