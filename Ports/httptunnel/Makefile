include ../../Library/GNU.mk

Title=		Httptunnel
Name=		httptunnel
Version=	3.3
Site=		http://www.nocrew.org/software/httptunnel/
Source=		http://www.nocrew.org/software/httptunnel//$(Name)-$(Version).tar.gz
License=	GPL

define after_install_hook
install -m 644 $(SourceDir)/{DISCLAIMER,FAQ,HACKING} $(InstallDir)/$(DocDir)/$(Name)
install -m 644 $(SourceDir)/doc/*.txt $(InstallDir)/$(DocDir)/$(Name)
endef

define test_hook
$(BinDir)/hts --version
$(BinDir)/htc --version
endef
