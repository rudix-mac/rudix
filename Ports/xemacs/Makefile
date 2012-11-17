# Restored from Rudix-2010

BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/Config.mk
RUDIX_PARALLEL_EXECUTION=no
include ../../Library/Rudix.mk
include ../../Library/ConfigureFormula.mk

Title=		XEmacs
Name=		xemacs
Version=	21.5.32
Revision=	0
URL=		http://ftp.xemacs.org/pub/xemacs/beta/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

ConfigureExtra += --with-mule

# Due static-gettext
ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv
endif

define install_post_hook
for x in b2m ctags ellcc etags gnuattach gnuclient gnudoit ootags ; do \
	mv $(InstallDir)/$(BinDir)/$$x $(InstallDir)/$(BinDir)/xemacs-$$x ; done
for x in ctags.1 etags.1 gnuattach.1 gnuclient.1 gnudoit.1 gnuserv.1 ; do \
	mv $(InstallDir)/$(ManDir)/man1/$$x $(InstallDir)/$(ManDir)/man1/xemacs-$$x ; done
endef

define test_inner_hook
$(BinDir)/xemacs --version
endef
