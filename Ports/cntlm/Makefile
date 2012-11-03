include ../../Library/GNU.mk

Title=		Cntlm
Name=		cntlm
Version=	0.92.3
Revision=	0
URL=		http://downloads.sourceforge.net/cntlm
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYRIGHT

define install_post_hook
mv $(InstallDir)/$(SysConfDir)/cntlm.conf \
	$(InstallDir)/$(SysConfDir)/cntlm.conf.default
endef
