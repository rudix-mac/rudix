# Foreign function call libraries
# http://www.gnu.org/software/libffcall/
# GPL

Name=		ffcall
Version=	1.10
Revision=	2
URL=		http://www.haible.de/bruno/gnu/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=		$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

include ../../Library/Rules.mk

prep: retrieve
	tar zxvf $(Source)
	touch prep

# FIXME: Can't build in x86-64 machine
build: prep $(DEPENDS)
	cd $(SourceDir) ; env CFLAGS="$(CFLAGS)" LDFLAGS="$(LDFLAGS)" \
	$(configure) ; make
	touch build

install: build
	install -d $(InstallDir)$(DocDir)
	cd $(SourceDir) ; make \
		DESTDIR=$(InstallDir) \
		htmldir=$(DocDir)/ffcall install
	install -d $(InstallDir)/$(DocDir)/$(Name)
	install -m 644 $(ReadMeFile) $(InstallDir)/$(DocDir)/$(Name)
	install -m 644 $(LicenseFile) $(InstallDir)/$(DocDir)/$(Name)
	install -m 644 $(SourceDir)/NEWS $(InstallDir)/$(DocDir)/$(Name)
	strip -x $(InstallDir)$(LibDir)/lib*.a
	touch install

test: install
	cd $(SourceDir) ; make check
	touch test
