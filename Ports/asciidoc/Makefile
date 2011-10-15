include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		AsciiDoc
Name=		asciidoc
Version=	8.6.6
Revision=	0
URL=		http://downloads.sourceforge.net/$(Name)
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(BuildDir)/README
LicenseFile=	$(BuildDir)/COPYING

define install_post_hook
mv $(InstallDir)$(Prefix)/etc/asciidoc/asciidoc.conf \
   $(InstallDir)$(Prefix)/etc/asciidoc/asciidoc.conf.default
endef

# Pure Python binaries
define test_inner_hook
endef
