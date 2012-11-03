# Package Maintainer: Qichang Liang
# email: kcleung@cs.otago.ac.nz

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		a2ps
Name=		a2ps
Version=	4.14
Revision=	0
URL=		http://ftp.gnu.org/gnu/a2ps/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define install_post_hook
mv $(InstallDir)/$(SysConfDir)/a2ps.cfg \
	$(InstallDir)/$(SysConfDir)/a2ps.cfg.default
mv $(InstallDir)/$(SysConfDir)/a2ps-site.cfg \
	$(InstallDir)/$(SysConfDir)/a2ps-site.cfg.default
endef
