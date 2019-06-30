include ../../Library/CMake.mk

Title=		STLink
Name=		stlink
Version=	1.5.1
Site=		https://github.com/texane/stlink
Source=		https://github.com/texane/stlink/archive/v$(Version).tar.gz
License=        BSD
Description=    STM32 discovery line linux programmer 
ReadMeFile=     $(SourceDir)/README.md
LicenseFile=     $(SourceDir)/LICENSE

BuildRequires += $(BinDir)/pkg-config	# pkgconfig
BuildRequires += $(LibDir)/libusb-*.la	# libusb | static-libusb
MakeExtra=      stlink-static
