include ../../Library/GNU.mk

Title=		NcFTP Client
Name=		ncftp
Version=	3.2.5
Site=		http://www.ncftp.com/
Source=		ftp://ftp.ncftp.com/ncftp/ncftp-$(Version)-src.tar.bz2
License=	The Clarified Artistic License

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/doc/LICENSE.txt

define install_post_hook
rmdir $(DestDir)$(SysConfDir)
endef

define test_hook
$(BinDir)/ncftp --version | grep $(Version)
endef
