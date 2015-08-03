BuildRequires += $(BinDir)/lunzip # lunzip

include ../../Library/GNU.mk

Title=		GNU ed
Name=		ed
Version=	1.12
Revision=	0
Site=		http://www.gnu.org/software/ed/
Source=		http://ftp.gnu.org/gnu/ed/$(Name)-$(Version).tar.lz
CheckSum=	095760399ea0e54fdfb4e17f5f7f093fbccb2f33
License=	GPL

define test_inner_hook
$(BinDir)/ed --version | grep $(Version)
endef
