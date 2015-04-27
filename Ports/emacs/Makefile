BuildRequires += $(BinDir)/xz # xz

include ../../Library/GNU.mk

Title=		GNU Emacs
Name=		emacs
Version=	24.5
Revision=	0
Site=		http://www.gnu.org/software/emacs/
Source=		http://ftp.gnu.org/gnu/emacs//$(Name)-$(Version).tar.xz
License=	GPL

define test_inner_hook
$(BinDir)/emacs --version | grep $(Version)
endef
