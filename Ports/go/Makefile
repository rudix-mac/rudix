include ../../Library/Config.mk
ifeq ($(OSXVersion),10.6)
RUDIX_STRIP_PACKAGE=no
endif
include ../../Library/Rudix.mk

Title=		The Go Programming Language
Name=		go
Version=	1.1
Revision=	0
URL=		http://go.googlecode.com/files
Source=		$(Name)$(Version).src.tar.gz

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
install -d $(InstallDir)/$(LibDir)/go/src
cp -a $(BuildDir)/src/pkg $(InstallDir)/$(LibDir)/go/src
cp -a $(BuildDir)/lib $(InstallDir)/$(LibDir)/go
cp -a $(BuildDir)/doc $(InstallDir)/$(LibDir)/go
cp -a $(BuildDir)/api $(InstallDir)/$(LibDir)/go
cp -a $(BuildDir)/include $(InstallDir)/$(LibDir)/go
install -d $(InstallDir)/$(DataDir)/emacs/site-lisp
install -m 644 $(BuildDir)/misc/emacs/*.el $(InstallDir)/$(DataDir)/emacs/site-lisp
$(install_base_documentation)
endef

define test_inner_hook
$(BinDir)/go help
$(BinDir)/go run tests/hello.go
$(BinDir)/go run tests/rat_scan.go
endef
