RUDIX_ENABLE_NLS=no
BuildRequires += $(BinDir)/gnused

include ../../Library/GNU.mk

Title=		Quilt
Name=		quilt
Version=	0.66
Site=		https://savannah.nongnu.org/projects/quilt
Source=		https://git.savannah.nongnu.org/cgit/quilt.git/snapshot/quilt-$(Version).tar.gz
License=        GPLv2
ReadMeFile=	${BuildDir}/doc/README

GnuConfigureExtra += --without-getopt
GnuConfigureExtra += --without-date
GnuConfigureExtra += --with-md5sum=md5

MakeInstallFlags = BUILD_ROOT=$(DestDir)

define test_hook
$(BinDir)/quilt --version | grep $(Version)
endef
