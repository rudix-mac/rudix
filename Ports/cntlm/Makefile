include ../../Library/GNU.mk

Title=		Cntlm
Name=		cntlm
Version=	0.92.3
Revision=	1
URL=		http://downloads.sourceforge.net/cntlm
Source=		$(Name)-$(Version).tar.bz2

LicenseFile=	$(SourceDir)/COPYRIGHT

define install_post_hook
mv $(InstallDir)/$(SysConfDir)/cntlm.conf \
	$(InstallDir)/$(SysConfDir)/cntlm.conf.default
endef
