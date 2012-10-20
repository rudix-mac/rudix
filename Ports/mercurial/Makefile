BuildRequires += $(BinDir)/msgfmt # gettext/libintl

include ../../Library/Python.mk

Title=		Mercurial
Name=		mercurial
Version=	2.2.2
Revision=	0
URL=		http://www.selenic.com/mercurial/release/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define test_post_hook
cd $(SourceDir)/tests ; $(Python) run-tests.py
endef

define test_inner_hook
$(BinDir)/hg --version
endef
