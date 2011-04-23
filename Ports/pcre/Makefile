include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Description=	Perl-compatible regular expression library
Site=		http://www.pcre.org/
License=	BSD
Title=		PCRE
Name=		pcre
Version=	8.12
Revision=	0
URL=		ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENCE

GnuConfigureExtra += --enable-utf8

define test_post_hook
cd $(SourceDir) ; ./RunTest
endef
