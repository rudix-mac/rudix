include ../../Library/GNU.mk

Title=		Httptunnel
Name=		httptunnel
Version=	3.3
Revision=	4
URL=		http://www.nocrew.org/software/httptunnel/
Source=		$(Name)-$(Version).tar.gz

define install_post_hook
install -m 644 $(SourceDir)/{DISCLAIMER,FAQ,HACKING} $(InstallDir)/$(DocDir)/$(Name)
install -m 644 $(SourceDir)/doc/*.txt $(InstallDir)/$(DocDir)/$(Name)
endef

define test_inner_hook
$(BinDir)/hts --version
$(BinDir)/htc --version
endef
