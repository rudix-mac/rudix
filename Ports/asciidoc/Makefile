include ../../Library/GNU.mk

Title=		AsciiDoc
Name=		asciidoc
Version=	8.6.7
Revision=	0
URL=		http://sourceforge.net/projects/asciidoc/files/asciidoc/$(Version)/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(BuildDir)/README
LicenseFile=	$(BuildDir)/COPYING

define install_post_hook
mv $(InstallDir)$(Prefix)/etc/asciidoc/asciidoc.conf \
   $(InstallDir)$(Prefix)/etc/asciidoc/asciidoc.conf.default
endef

# Do nothing
define test_inner_hook
echo Nothing to test here
endef

define final_inner_hook
/usr/local/bin/asciidoc
endef
