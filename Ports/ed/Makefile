PrepRequires = $(BinDir)/lunzip # lunzip

include ../../Library/Configure.mk

Title=		GNU ed
Name=		ed
Version=	1.13
Site=		http://www.gnu.org/software/ed/
Source=		http://ftp.gnu.org/gnu/ed/$(Name)-$(Version).tar.lz
License=	GPLv3

ConfigureExtra += CFLAGS="$(CFlags)" LDFLAGS="$(LdFLags)"

define install_post_hook
rm -f $(DestDir)$(InfoDir)/dir
cd $(DestDir)$(BinDir) && ln -sf ed gnued
cd $(DestDir)$(InfoDir) && ln -sf ed.info gnued.info
cd $(DestDir)$(ManDir)/man1 && ln -sf ed.1 gnued.1
endef

define test_hook
$(BinDir)/ed --version | grep $(Version)
endef
