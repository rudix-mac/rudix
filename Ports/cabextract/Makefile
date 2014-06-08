include ../../Library/GNU.mk

Title=		Cabextract
Name=		cabextract
Version=	1.4
Revision=	4
Site=		http://www.cabextract.org.uk/
URL=		http://www.cabextract.org.uk/
Source=		$(Name)-$(Version).tar.gz
License=	GPL

define install_post_hook
install -m 755 $(SourceDir)/src/cabinfo $(InstallDir)$(BinDir)
install -m 644 $(SourceDir)/doc/{magic,*.html} $(InstallDir)/$(DocDir)/$(Name)
endef

define test_inner_hook
$(BinDir)/cabextract --version | grep $(Version)
endef
