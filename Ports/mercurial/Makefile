BuildRequires += $(BinDir)/msgfmt # gettext/libintl

include ../../Library/Python.mk

Title=		Mercurial
Name=		mercurial
Version=	2.9.2
Revision=	0
Site=		http://mercurial.selenic.com/
URL=		http://www.selenic.com/mercurial/release/
Source=		$(Name)-$(Version).tar.gz
License=	GPL

ifeq ($(RUDIX_RUN_ALL_TESTS),yes)
define check_inner_hook
cd $(SourceDir)/tests && $(Python) run-tests.py || $(call error_color,One or more tests failed)
endef
endif

define test_inner_hook
$(BinDir)/hg --version | grep $(Version)
endef
