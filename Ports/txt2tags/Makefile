BuildRequires += $(BinDir)/msgfmt # gettext

include ../../Library/Unix.mk

Title=		txt2tags
Name=		txt2tags
Version=	2.6
Site=		http://txt2tags.org/
Source=		http://txt2tags.googlecode.com/files//$(Name)-$(Version).tgz
License=	GPL

define after_prep_hook
cp txt2tags.Makefile $(SourceDir)/Makefile
endef

define test_hook
cd $(SourceDir)/test ; ./run.py
$(BinDir)/txt2tags --version
endef
