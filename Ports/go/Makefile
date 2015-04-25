ifeq ($(OSXVersion),10.6)
RUDIX_STRIP_PACKAGE=no
endif
include ../../Library/Rudix.mk

Description=	The Go Programming Language
Title=		Go Language
Name=		go
Version=	1.4
Revision=	0
Site=		http://golang.org/
Source=		http://golang.org/dl/$(Name)$(Version).src.tar.gz
License=	BSD

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
cp -a $(BuildDir)/src $(InstallDir)/$(LibDir)/go
cp -a $(BuildDir)/lib $(InstallDir)/$(LibDir)/go
cp -a $(BuildDir)/doc $(InstallDir)/$(LibDir)/go
cp -a $(BuildDir)/api $(InstallDir)/$(LibDir)/go
cp -a $(BuildDir)/include $(InstallDir)/$(LibDir)/go
install -d $(InstallDir)/$(DataDir)/emacs/site-lisp
$(install_base_documentation)
install -m 644 $(SourceDir)/{AUTHORS,PATENTS,CONTRIBUTORS,VERSION} $(InstallDir)/$(DocDir)/go
endef

define test_inner_hook
$(BinDir)/go version | grep $(Version)
$(BinDir)/go run tests/hello.go
$(BinDir)/go run tests/rat_scan.go
endef
