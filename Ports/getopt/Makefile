include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/UnixFormula.mk

Title=		Getopt
Name=		getopt
Version=	1.1.4
Revision=	0
URL=		http://software.frodo.looijaard.name/getopt/files
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

LdFlags += -framework CoreFoundation -liconv -lintl

MakeExtra += LIBCGETOPT=0

define test_inner_hook
endef
