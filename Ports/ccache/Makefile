include ../../Library/GNU.mk

CREATE_LIBEXEC_LINKS?=yes

Title=		Ccache
Name=		ccache
Version=	4.7
Site=		https://ccache.dev
Source=		https://github.com/ccache/ccache/releases/download/v$(Version)/ccache-$(Version).tar.xz
License=	GPLv3+

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/LICENSE.adoc

ifeq ($(CREATE_LIBEXEC_LINKS),yes)
define after_install_hook
install -d $(DestDir)$(LibExecDir)/ccache
cd $(DestDir)$(LibExecDir)/ccache && \
for x in cc gcc clang g++ c++ llvm-gcc llvm-g++ ; do \
	ln -sf ../../bin/ccache $$x ; done
endef
endif

define test_hook
$(BinDir)/ccache --version | grep $(Version)
endef
