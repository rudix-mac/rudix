include ../../Library/Configure.mk

Title=		CMake
Name=		cmake
Version=	3.2.2
Revision=	0
Site=		http://www.cmake.org
Source=		http://www.cmake.org/files/v3.2/cmake-${Version}.tar.gz
License=        BSD

ReadMeFile=	$(SourceDir)/README.rst
LicenseFile=	$(SourceDir)/Copyright.txt

ConfigureExtra += --docdir=$(DocDir)/cmake

define test_inner_hook
$(BinDir)/cmake --version | grep $(Version)
endef
