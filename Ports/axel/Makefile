include ../../Library/Configure.mk

Title=		Axel Download Accelerator
Name=		axel
Version=	2.4
Revision=	0
URL=		http://alioth.debian.org/frs/download.php/3015/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define install_post_hook
mv $(InstallDir)/$(SysConfDir)/axelrc \
	$(InstallDir)/$(SysConfDir)/axelrc.default
endef

define test_inner_hook
$(BinDir)/axel -V
endef
