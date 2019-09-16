include ../../Library/GNU.mk

Title=		PSPP
Name=		pspp
Version=	1.2.0
Site=		https://www.gnu.org/software/pspp
Source=		http://ftpmirror.gnu.org/pspp/pspp-1.2.0.tar.gz
License=        GPL3

BuildRequires += $(LibDir)/pkgconfig/libxml-2.0.pc
BuildRequires += $(LibDir)/pkgconfig/gsl.pc
BuildRequires += $(BinDir)/msgfmt

GnuConfigureExtra += --without-gui

define test_hook
$(BinDir)/pspp --version | grep $(Version)
endef
