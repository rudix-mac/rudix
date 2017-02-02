include ../../Library/GNU.mk

Title=		Monit
Name=		monit
Version=	5.8.1
Site=		http://mmonit.com/monit/
Source=		http://mmonit.com/monit/dist//$(Name)-$(Version).tar.gz
License=	AGPL

define install_post_hook
chmod +w $(PortDir)/$(InstallDir)/$(BinDir)/monit
install -d $(InstallDir)/$(SysConfDir)
install -m 644 $(SourceDir)/monitrc $(InstallDir)/$(SysConfDir)/monitrc.default
endef

define test_hook
$(BinDir)/monit -h
endef
