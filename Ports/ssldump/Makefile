include ../../Library/GNU.mk

Title=		SSLdump
Name=		ssldump
Version=	0.9b3
Revision=	3
URL=		http://www.rtfm.com/ssldump/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYRIGHT

GnuConfigureExtra += --host=i386-freebsd

MakeInstallExtra += -B
MakeInstallExtra += prefix=$(PortDir)/$(InstallDir)/$(Prefix)
MakeInstallExtra += MANDIR=$(PortDir)/$(InstallDir)/$(Prefix)/share/man

define test_inner_hook
$(SBinDir)/ssldump -version
endef
