include ../../Library/Configure.mk

Title=		CMake
Name=		cmake
Version=	3.17.3
Site=		https://cmake.org
Source=		https://cmake.org/files/v3.17/cmake-${Version}.tar.gz
License=        BSD

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/Copyright.txt

ConfigureExtra += --docdir=$(DocDir)/cmake

define test_hook
$(BinDir)/cmake --version | grep $(Version)
endef
