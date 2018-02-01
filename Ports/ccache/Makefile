CREATE_LIBEXEC_LINKS?=yes

include ../../Library/GNU.mk

Title=		ccache
Name=		ccache
Version=	3.3.6
Site=		https://ccache.samba.org
Source=		https://samba.org/ftp/ccache/$(Name)-$(Version).tar.bz2
License=	GPLv3+

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/LICENSE.txt

ifeq ($(CREATE_LIBEXEC_LINKS),yes)
define install_post_hook
install -d $(DestDir)$(LibExecDir)/ccache
cd $(DestDir)$(LibExecDir)/ccache && \
for x in cc gcc clang g++ c++ llvm-gcc llvm-g++ ; do \
	ln -sf ../../bin/ccache $$x ; done
endef
endif

define test_hook
$(BinDir)/ccache --version | grep $(Version)
endef
