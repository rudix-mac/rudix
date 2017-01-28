BuildRequires += $(LibDir)/libpcap.a # static-libpcap

include ../../Library/GNU.mk

Title=		SSLdump
Name=		ssldump
Version=	0.9b3
Site=		http://www.rtfm.com/ssldump/
Source=		http://www.rtfm.com/ssldump//$(Name)-$(Version).tar.gz
License=	BSD

LicenseFile=	$(SourceDir)/COPYRIGHT

GnuConfigureExtra += --host=i386-freebsd
GnuConfigureExtra += --sbindir=$(BinDir)

MakeInstallExtra += -B
MakeInstallExtra += prefix=$(PortDir)/$(InstallDir)/$(Prefix)
MakeInstallExtra += MANDIR=$(PortDir)/$(InstallDir)/$(ManDir)
MakeInstallExtra += BINDIR=$(PortDir)/$(InstallDir)/$(BinDir)

define test_inner_hook
$(BinDir)/ssldump -v | grep $(Version)
endef
