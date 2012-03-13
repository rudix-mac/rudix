include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		SSLdump
Name=		ssldump
Version=	0.9b3
Revision=	2
URL=		http://www.rtfm.com/ssldump/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYRIGHT

GnuConfigureExtra += --host=i386-freebsd

MakeInstallExtra += -B
MakeInstallExtra += prefix=$(PortDir)/$(InstallDir)/$(Prefix)
MakeInstallExtra += MANDIR=$(PortDir)/$(InstallDir)/$(Prefix)/share/man

ifdef FOO
prep: retrieve
	tar zxvf $(Source)
	cd $(SourceDir) ; patch < $(PortDir)/configure.patch
	cd $(SourceDir)/base ; patch < $(PortDir)/pcap-snoop.c.patch
	touch prep

build: prep $(DEPENDS)
	cd $(SourceDir) ; $(configure) --host=i386-freebsd ; $(make)
	touch build

install: build
# pass -B option to make due an INSTALL file in the same directory
# Mac OS X with HLS+ is case insensitive. -B force rules
	cd $(SourceDir) ; \
	make -B prefix=$(InstallDir)$(Prefix) \
		MANDIR=$(InstallDir)$(Prefix)/share/man install

	install -d $(InstallDir)/$(DocDir)/$(Name)
	install -m 644 $(SourceDir)/{COPYRIGHT,CREDITS,ChangeLog,ReadMeFile} $(InstallDir)/$(DocDir)/$(Name)

	strip $(InstallDir)$(Prefix)/sbin/*
	touch install
endif