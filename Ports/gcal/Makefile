include ../../Library/GNU.mk

BuildRequires += $(LibDir)/libintl.la # gettext

Title=		GNU gcal
Name=		gcal
Version=	4.1
Site=		http://www.gnu.org/software/gcal/
Source=		http://ftp.gnu.org/gnu/gcal//$(Name)-$(Version).tar.xz
License=	GPL

define test_hook
$(BinDir)/gcal --version | grep $(Version)
endef
