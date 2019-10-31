# Contributor: Qichang Liang <kcleung@cs.otago.ac.nz>

include ../../Library/GNU.mk

Title=		GNU a2ps
Name=		a2ps
Version=	4.14
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/$(Name)/$(Name)-$(Version).tar.gz
License=	GPLv3

define after_install_hook
mv $(InstallDir)/$(SysConfDir)/a2ps.cfg \
	$(InstallDir)/$(SysConfDir)/a2ps.cfg.default
mv $(InstallDir)/$(SysConfDir)/a2ps-site.cfg \
	$(InstallDir)/$(SysConfDir)/a2ps-site.cfg.default
endef

define test_hook
$(BinDir)/a2ps --version | grep $(Version)
endef
