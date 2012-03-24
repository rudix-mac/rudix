# Berkeley DB
# http://www.oracle.com/technology/products/berkeley-db/
# BSD

include ../../Library/Config.mk
include ../../Library/Rudix.mk

Title=		Berkeley DB
Name=		db
Version=	5.3.15
Revision=	0
URL=		http://download.oracle.com/otn/berkeley-db/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

ifdef STATIC_ONLY
CONFIG_OPTS=	--enable-static --disable-shared
else
CONFIG_OPTS=	--enable-static --enable-shared --enable-java
endif

define build_inner_hook
cd $(SourceDir)/build_unix ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	../dist/$(configure) $(CONFIG_OPTS)	\
		--prefix=$(Prefix)	\
		--docdir=$(DocDir)/db	\
		--enable-compat185 --enable-dump185 \
		--enable-cxx ; $(make)
endef

define install_post_hook
cd $(SourceDir)/build_unix ; \
make DESTDIR=$(InstallDir) docdir=$(DocDir)/db install
chmod +w $(InstallDir)$(BinDir)/*
endef
