include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	Monit is a utility for managing and monitoring, processes, files, directories and filesystems
Site=		http://mmonit.com/monit/
License=	GPL
Title=		Monit
Name=		monit
Version=	5.2.5
Revision=	0
URL=		http://mmonit.com/monit/dist/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

define install_post_hook
chmod +w $(PortDir)/$(InstallDir)/$(BinDir)/monit
endef
