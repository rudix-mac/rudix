include ../../Library/Configure.mk

Title=		CMake
Name=		cmake
Version=	3.13.4
Site=		https://cmake.org
Source=		https://github.com/Kitware/CMake/releases/download/v3.13.2/cmake-3.13.2.tar.gz
License=        BSD

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/Copyright.txt

ConfigureExtra += --docdir=$(DocDir)/cmake

define test_hook
$(BinDir)/cmake --version | grep $(Version)
endef
