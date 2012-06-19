# Autoconf 2.62 or better is required.
BuildRequires += $(BinDir)/autoconf

include ../../Library/GNU.mk

Title=		GNU Automake
Name=		automake
Version=	1.12.1
Revision=	0
URL=		http://ftp.gnu.org/gnu/automake/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

EnvExtra += AUTOCONF=/usr/local/bin/autoconf

define final_inner_hook
$(BinDir)/automake --version
endef
