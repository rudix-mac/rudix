include ../../Library/Custom.mk

Title=		Boost C++ Libraries
Name=		boost
Version=	1.72.0
AltVersion=	1_72_0
Site=		http://www.boost.org/
Source=		https://sourceforge.net/projects/boost/files/boost/$(Version)/$(Name)_$(AltVersion).tar.bz2
Source=		https://dl.bintray.com/boostorg/release/$(Version)/source/boost_$(AltVersion).tar.bz2
License=	Boost Software License

ReadMeFile=	README
LicenseFile=$(SourceDir)/LICENSE_1_0.txt

UncompressedName = $(Name)_$(AltVersion)

define build_hook
cd $(BuildDir) && ./bootstrap.sh --prefix=$(Prefix) --with-icu && ./b2
endef

define install_hook
cd $(BuildDir) && ./b2 install --prefix=$(DestDir)$(Prefix)
$(install_base_documentation)
endef
