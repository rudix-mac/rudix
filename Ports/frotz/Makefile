include ../../Library/Unix.mk

Title=		Frotz
Name=		frotz
Version=	2.43
Site=		http://frotz.sourceforge.net/
Source=		http://downloads.sourceforge.net/frotz/$(Name)-$(Version).tar.gz
License=	GPL

MakeInstallExtra += PREFIX=$(PortDir)/$(InstallDir)$(Prefix)
MakeInstallExtra += MAN_PREFIX=$(PortDir)/$(InstallDir)$(ManDir)
MakeInstallExtra += install_dumb

define after_install_hook
install $(SourceDir)/{AUTHORS,ChangeLog,HOW_TO_PLAY,TODO,doc/*.conf*} \
	$(PortDir)/$(InstallDir)$(DocDir)
endef
