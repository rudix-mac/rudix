include ../../Library/Config.mk
include ../../Library/Rudix.mk

Description=	Boost provides free portable peer-reviewed C++ libraries
Site=		http://www.boost.org/
License=	MIT-like
Title=		Boost C++ Libraries
Name=		boost
Version=	1.46.1
AltVersion=	1_46_1
Revision=	0
URL=		http://downloads.sourceforge.net/boost
Source=		$(Name)_$(AltVersion).tar.bz2
ReadMeFile=	$(SourceDir)/index.html
LicenseFile=	$(SourceDir)/LICENSE_1_0.txt

UncompressedName = $(Name)_$(AltVersion)

ifdef FOO
build: prep $(DEPENDS)
	cd $(SourceDir) ; ./bootstrap.sh ; \
	./bjam toolset=darwin architecture=x86 address-model=32_64
	touch build

install: build
	install -d $(InstallDir)$(BinDir)
	install -m 755 $(SourceDir)/tools/jam/src/bin.*/bjam $(InstallDir)$(BinDir)
	install -d $(InstallDir)$(LibDir)
	install -m 644 $(SourceDir)/stage/lib/lib*.dylib $(InstallDir)$(LibDir)
	cd $(SourceDir)/stage/lib ; (tar -cv lib*.dylib | tar -xv -C $(InstallDir)$(LibDir))
	install -m 644 $(SourceDir)/stage/lib/lib*.a $(InstallDir)$(LibDir)
	cd $(SourceDir) ; find boost -type d -exec install -d $(InstallDir)$(Prefix)/include/{} \;
	cd $(SourceDir) ; find boost ! -name \*.orig -type f -exec install -m 644 {} $(InstallDir)$(Prefix)/include/{} \;
	install -d $(InstallDir)/$(DocDir)/$(Name)
	install -m 644 $(SourceDir)/{LicenseFile_1_0.txt,index.*} $(InstallDir)/$(DocDir)/$(Name)
endif