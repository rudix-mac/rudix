include ../../Library/GNU.mk

Title=		AsciiDoc
Name=		asciidoc
Version=	8.6.8
Revision=	0
URL=		http://sourceforge.net/projects/asciidoc/files/asciidoc/$(Version)/
Source=		$(Name)-$(Version).tar.gz

define install_post_hook
mv $(InstallDir)$(Prefix)/etc/asciidoc/asciidoc.conf \
   $(InstallDir)$(Prefix)/etc/asciidoc/asciidoc.conf.default
endef

# Do nothing
define test_inner_hook
endef

define test_inner_hook
$(BinDir)/asciidoc
endef
