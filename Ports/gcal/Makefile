include ../../Library/GNU.mk

BuildRequires += $(LibDir)/libintl.la # gettext

Title=		GNU gcal
Name=		gcal
Version=	4.1
Site=		$(GnuHome)/$(Name)
Source=		$(GnuMirror)/gcal//$(Name)-$(Version).tar.xz
License=	GPL

define test_hook
$(BinDir)/gcal --version | grep $(Version)
endef
