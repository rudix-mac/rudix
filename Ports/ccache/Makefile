include ../../Library/GNU.mk

Title=		ccache
Name=		ccache
Version=	3.1.8
Revision=	0
URL=		http://samba.org/ftp/ccache/
Source=		$(Name)-$(Version).tar.bz2

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/LICENSE.txt

define install_post_hook
install -d $(InstallDir)/$(LibExecDir)/ccache
cd $(InstallDir)/$(LibExecDir)/ccache ; \
for x in c++ cc g++ gcc ; do \
	ln -sf $(BinDir)/ccache $$x ; done
install -m 644 $(BuildDir)/{*.txt,*.html} $(InstallDir)/$(DocDir)/ccache
endef

define test_inner_hook
$(BinDir)/ccache --version
endef
