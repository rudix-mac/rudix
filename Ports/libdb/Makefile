include ../../Library/Config.mk
include ../../Library/Rudix.mk

Title=		Berkeley DB (Library)
Name=		libdb
Version=	5.3.21
Revision=	0
URL=		http://download.oracle.com/otn/berkeley-db/
Source=		db-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

UncompressedName = db-$(Version)

ifdef ONLY_STATIC_LIBS
ConfigureExtra += --enable-static --disable-shared
else
ConfigureExtra += --enable-static --enable-shared
endif

define build_inner_hook
cd $(SourceDir)/build_unix ; \
env CFLAGS="$(CFlags)" LDFLAGS="$(LdFlags)"	\
	../dist/$(configure) $(CongigureExtra)	\
		--prefix=$(Prefix)		\
		--docdir=$(DocDir)/db ; $(make)
endef

define install_inner_hook
cd $(SourceDir)/build_unix ; \
$(make) DESTDIR=$(PortDir)/$(InstallDir) install
rm -rf $(InstallDir)/$(BinDir)
$(install_base_documentation)
endef
