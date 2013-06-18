include ../../Library/GNU.mk

Title=		Monit
Name=		monit
Version=	5.5.1
Revision=	0
URL=		http://mmonit.com/monit/dist/
Source=		$(Name)-$(Version).tar.gz

define install_post_hook
chmod +w $(PortDir)/$(InstallDir)/$(BinDir)/monit
install -d $(InstallDir)/$(SysConfDir)
install -m 664 $(SourceDir)/monitrc $(InstallDir)/$(SysConfDir)/monitrc.default
endef

define test_inner_hook
$(BinDir)/monit -h
endef
