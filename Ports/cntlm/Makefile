include ../../Library/GNU.mk

Title=		NTLM Authentication Proxy
Name=		cntlm
Version=	0.92.3
Site=		http://cntlm.sourceforge.net
Source=		http://downloads.sourceforge.net/cntlm/$(Name)-$(Version).tar.bz2
License=	GPLv2

LicenseFile=	$(SourceDir)/COPYRIGHT

define install_post_hook
mv $(InstallDir)/$(SysConfDir)/cntlm.conf \
	$(InstallDir)/$(SysConfDir)/cntlm.conf.default
endef

define test_inner_hook
$(BinDir)/cntlm -h 2>&1 | grep $(Version)
endef
