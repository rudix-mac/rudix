BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/Configure.mk

Title=		XEmacs
Name=		xemacs
Version=	21.5.33
Site=		http://www.xemacs.org/
Source=		http://ftp.xemacs.org/pub/xemacs/beta//$(Name)-$(Version).tar.gz
License=	GPL


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
$(BinDir)/xemacs --version | grep 21.5
endef
