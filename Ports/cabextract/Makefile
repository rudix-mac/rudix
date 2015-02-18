include ../../Library/GNU.mk

Title=		Cabextract
Name=		cabextract
Version=	1.6
Revision=	0
Site=		http://www.cabextract.org.uk/
Source=		http://www.cabextract.org.uk/$(Name)-$(Version).tar.gz
Checksum=	64f6d5056d3e417a943648c23cb22218b7079ced
License=	GPL

# Avoid HTTP error 406
FetchExtra += -A Mozilla/4.0

define install_post_hook
install -m 755 $(SourceDir)/src/cabinfo $(InstallDir)$(BinDir)
install -m 644 $(SourceDir)/doc/{magic,*.html} $(InstallDir)/$(DocDir)/$(Name)
endef

define test_inner_hook
$(BinDir)/cabextract --version | grep $(Version)
endef
