include ../../Library/GNU.mk

Title=		NcFTP Client
Name=		ncftp
Version=	3.2.5
Revision=	4
Source=		$(Name)-$(Version)-src.tar.bz2
Site=		http://www.ncftp.com/
License=	The Clarified Artistic License

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/doc/LICENSE.txt

define install_post_hook
install -m 644 $(SourceDir)/*.txt $(InstallDir)/$(DocDir)/$(Name)
install -m 644 $(SourceDir)/doc/*.txt $(InstallDir)/$(DocDir)/$(Name)
install -m 644 $(SourceDir)/doc/html/* $(InstallDir)/$(DocDir)/$(Name)
endef

define test_inner_hook
$(BinDir)/ncftp --version | grep $(Version)
endef
