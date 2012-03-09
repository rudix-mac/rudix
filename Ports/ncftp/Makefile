include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		NcFTP Client
Name=		ncftp
Version=	3.2.5
Revision=	1
Source=		$(Name)-$(Version)-src.tar.bz2
URL=		ftp://ftp.ncftp.com/ncftp

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/doc/LICENSE.txt

#GnuConfigureExtra += --disable-universal 
#GnuConfigureExtra += --disable-precomp

define install_post_hook
install -m 644 $(SourceDir)/*.txt $(InstallDir)/$(DocDir)/$(Name)
install -m 644 $(SourceDir)/doc/*.txt $(InstallDir)/$(DocDir)/$(Name)
install -m 644 $(SourceDir)/doc/html/* $(InstallDir)/$(DocDir)/$(Name)
endef
