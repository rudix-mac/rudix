BuildRequires += $(BinDir)/xz # xz

include ../../Library/GNU.mk

Title=		GNU Emacs
Name=		emacs
Version=	24.3
Revision=	0
URL=		http://ftp.gnu.org/gnu/emacs/
Source=		$(Name)-$(Version).tar.xz

define test_inner_hook
$(BinDir)/emacs --version
endef
