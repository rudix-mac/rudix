include ../../Library/GNU.mk

Title=		ccache
Name=		ccache
Version=	3.1.7
Revision=	1
URL=		http://samba.org/ftp/ccache/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/LICENSE.txt

define install_post_hook
install -d $(InstallDir)/$(Prefix)/libexec/ccache
cd $(InstallDir)/$(Prefix)/libexec/ccache ; \
for x in c++ cc g++ gcc ; do \
	ln -sf $(Prefix)/bin/ccache $$x ; done
install -m 644 $(BuildDir)/{*.txt,*.html} $(InstallDir)/$(DocDir)/ccache
endef

define final_inner_hook
$(BinDir)/ccache --version
endef
