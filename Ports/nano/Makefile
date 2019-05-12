include ../../Library/GNU.mk

BuildRequires += $(IncludeDir)/ncursesw/curses.h	# ncurses

Title=		GNU nano
Name=		nano
Version=	4.2
Site=		https://www.nano-editor.org
Source=		https://www.nano-editor.org/dist/v4/nano-$(Version).tar.xz
License=	GPLv3

GnuConfigureExtra += --enable-utf8

define after_install_hook
cd $(DestDir)$(BinDir) && ln -sf nano pico
endef

define test_hook
$(BinDir)/nano --version | grep $(Version)
endef
