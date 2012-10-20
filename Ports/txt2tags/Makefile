BuildRequires += $(BinDir)/msgfmt

include ../../Library/Unix.mk

Title=		txt2tags
Name=		txt2tags
Version=	2.6
Revision=	1
URL=		http://txt2tags.googlecode.com/files/
Source=		$(Name)-$(Version).tgz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define prep_post_hook
cp txt2tags.Makefile $(SourceDir)/Makefile
endef

define test_inner_hook
cd $(SourceDir)/test ; ./run.py
$(BinDir)/txt2tags -h
endef
