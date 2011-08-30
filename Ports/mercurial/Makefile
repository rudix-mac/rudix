BuildRequires += /usr/local/bin/msgfmt

include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/PythonFormula.mk

Description=	Mercurial is a free, distributed source control management tool
Site=		http://mercurial.selenic.com/
License=	GPL
Title=		Mercurial
Name=		mercurial
Version=	1.9.2
Revision=	0
URL=		http://www.selenic.com/mercurial/release/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define test_post_hook
cd $(SourceDir)/tests ; $(Python) run-tests.py
endef
