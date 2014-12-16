include ../../Library/Configure.mk

Title=		Axel Download Accelerator
Name=		axel
Version=	2.4
Revision=	0
Site=		http://axel.alioth.debian.org/
URL=		http://alioth.debian.org/frs/download.php/3015
#URL=		http://pkgs.fedoraproject.org/repo/pkgs/axel/axel-2.4.tar.gz/a2a762fce0c96781965c8f9786a3d09d/axel-2.4.tar.gz
Source=		$(Name)-$(Version).tar.gz
License=	GPL

define install_post_hook
mv $(InstallDir)/$(SysConfDir)/axelrc \
	$(InstallDir)/$(SysConfDir)/axelrc.default
endef

define test_inner_hook
$(BinDir)/axel -V | grep $(Version)
endef
