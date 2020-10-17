include ../../Library/Configure.mk

Title=		CMake
Name=		cmake
Version=	3.18.4
Site=		https://cmake.org
Source=		https://cmake.org/files/v3.18/cmake-${Version}.tar.gz
License=        BSD+MIT+Zlib

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/Copyright.txt

ConfigureExtra += --docdir=$(DocDir)/cmake

define test_hook
$(BinDir)/cmake --version | grep $(Version)
endef
