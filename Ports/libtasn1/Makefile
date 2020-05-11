include ../../Library/GNU.mk

Title=		libtasn1
Name=		libtasn1
Version=	4.16.0
Site=		https://www.gnu.org/software/libtasn1
Source=		https://ftp.gnu.org/gnu/libtasn1/libtasn1-$(Version).tar.gz
License=        GPL
ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/LICENSE

define test_hook
$(BinDir)/libtasn --version | grep $(Version)
endef
