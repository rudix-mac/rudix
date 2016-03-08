ifeq ($(OSXVersion),10.6)
RUDIX_STRIP_PACKAGE=no
endif

BuildRequires += $(BinDir)/go  # go >= 1.4.2-1

GoRoot=$(LibDir)/go

include ../../Library/Rudix.mk

Description=	The Go Programming Language
Title=		Go Language
Name=		go
Version=	1.6
Revision=	0
Site=		http://golang.org/
Source=		http://golang.org/dl/$(Name)$(Version).src.tar.gz
Checksum=	3282b6cb1e491662f7067544605d8cbf6f016553
License=	BSD

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/LICENSE

UncompressedName=go

define build_inner_hook
cd $(BuildDir)/src && \
	env GOROOT_BOOTSTRAP=$(GoRoot) \
		GOROOT_FINAL=$(GoRoot) ./all.bash
endef

define install_inner_hook
install -d $(InstallDir)/$(LibDir)/go
cp -a $(BuildDir)/{favicon.ico,robots.txt} $(InstallDir)$(GoRoot)
cp -a $(BuildDir)/api $(InstallDir)$(GoRoot)
cp -a $(BuildDir)/bin $(InstallDir)$(GoRoot)
cp -a $(BuildDir)/doc $(InstallDir)$(GoRoot)
#cp -a $(BuildDir)/include $(InstallDir)$(GoRoot)
cp -a $(BuildDir)/lib $(InstallDir)$(GoRoot)
cp -a $(BuildDir)/misc $(InstallDir)$(GoRoot)
cp -a $(BuildDir)/pkg $(InstallDir)$(GoRoot)
cp -a $(BuildDir)/src $(InstallDir)$(GoRoot)
cp -a $(BuildDir)/test $(InstallDir)$(GoRoot)

$(install_base_documentation)
install -m 644 $(SourceDir)/{AUTHORS,PATENTS,CONTRIB*,VERSION} $(InstallDir)/$(DocDir)/go
install -d $(InstallDir)$(BinDir)
cd $(InstallDir)$(BinDir) && ln -sf ../lib/go/bin/* .
endef

define test_inner_hook
$(BinDir)/go version | grep $(Version)
$(BinDir)/go run tests/hello.go
$(BinDir)/go run tests/rat_scan.go
endef
