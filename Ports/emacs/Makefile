BuildRequires += $(BinDir)/xz # xz

include ../../Library/GNU.mk

Title=		GNU Emacs
Name=		emacs
Version=	24.3
Revision=	1
Site=		http://www.gnu.org/software/emacs/
URL=		http://ftp.gnu.org/gnu/emacs/
Source=		$(Name)-$(Version).tar.xz
License=	GPL

define test_inner_hook
$(BinDir)/emacs --version | grep $(Version)
endef
