include ../../Library/GNU.mk

Title=		GNU nano
Name=		nano
Version=	2.9.4
Site=		https://www.nano-editor.org
Source=		https://www.nano-editor.org/dist/v2.9/nano-$(Version).tar.xz
License=	GPLv3

# FIXME:
# GnuConfigureExtra += --enable-utf8
# * checking whether to use slang... no (should we add support?)

define install_post_hook
cd $(DestDir)$(BinDir) && ln -sf nano pico
endef

define test_hook
$(BinDir)/nano --version | grep $(Version)
endef
