include ../../Library/Config.mk
include ../../Library/Rudix.mk

Title=		Go
Name=		go
Version=	1.0.2
Revision=	0
URL=		http://go.googlecode.com/files
Source=		$(Name)$(Version).src.tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

UncompressedName=go

define build_inner_hook
cd $(BuildDir)/src ; GOROOT_FINAL=/usr/local/lib/go ./all.bash
endef

define install_inner_hook
install -d $(InstallDir)/$(BinDir)
install -m 755 $(BuildDir)/bin/* $(InstallDir)/$(BinDir)
install -d $(InstallDir)/$(LibDir)/go
cp -a $(BuildDir)/pkg $(InstallDir)/$(LibDir)/go
install -d $(InstallDir)/$(DataDir)/emacs/site-lisp
install -m 644 $(BuildDir)/misc/emacs/*.el $(InstallDir)/$(DataDir)/emacs/site-lisp
$(install_base_documentation)
endef
