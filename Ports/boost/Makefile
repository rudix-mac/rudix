include ../../Library/Rudix.mk

Title=		Boost C++ Libraries
Name=		boost
Version=	1.60.0
AltVersion=	1_60_0
Revision=	0
Site=		http://www.boost.org/
Source=		http://downloads.sourceforge.net/boost/$(Name)_$(AltVersion).tar.bz2
License=	Boost Software License

ReadMeFile=	README
LicenseFile=$(SourceDir)/LICENSE_1_0.txt

UncompressedName = $(Name)_$(AltVersion)

define build_inner_hook
cd $(BuildDir) && ./bootstrap.sh --prefix=$(Prefix) --with-icu && ./b2
endef

define install_inner_hook
cd $(BuildDir) && ./b2 install --prefix=$(DestDir)$(Prefix)
$(install_base_documentation)
endef
