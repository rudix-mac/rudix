BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=          GNU Aspell
Name=           aspell
Version=        0.60.6.1
Revision=	1
URL=            http://ftp.gnu.org/gnu/aspell/
Source=         $(Name)-$(Version).tar.gz

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation
endif

define test_inner_hook
$(BinDir)/aspell --version
endef
