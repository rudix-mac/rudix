include ../../Library/GNU.mk

Title=		AsciiDoc
Name=		asciidoc
Version=	8.6.9
Site=		http://www.methods.co.nz/asciidoc/
Source=		http://sourceforge.net/projects/asciidoc/files/asciidoc/$(Version)//$(Name)-$(Version).tar.gz
License=	GPL

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
