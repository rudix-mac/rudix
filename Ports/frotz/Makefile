include ../../Library/Unix.mk

Title=		Frotz
Name=		frotz
Version=	2.43
Revision=	6
URL=		http://downloads.sourceforge.net/frotz
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

MakeInstallExtra += PREFIX=$(PortDir)/$(InstallDir)$(Prefix)
MakeInstallExtra += MAN_PREFIX=$(PortDir)/$(InstallDir)$(ManDir)
MakeInstallExtra += install_dumb

define install_post_hook
install $(SourceDir)/{AUTHORS,ChangeLog,HOW_TO_PLAY,TODO,doc/*.conf*} \
	$(PortDir)/$(InstallDir)$(DocDir)
endef
