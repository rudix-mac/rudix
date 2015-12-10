CREATE_LIBEXEC_LINKS?=yes

include ../../Library/GNU.mk

Title=		ccache
Name=		ccache
Version=	3.2.4
Revision=	0
Site=		https://ccache.samba.org
Source=		https://samba.org/ftp/ccache/$(Name)-$(Version).tar.bz2
Checksum=	0fcd0c8c1e75a4c5cab4671b6c07a0c55d6ee215
License=	GPL

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/LICENSE.txt

ifeq ($(CREATE_LIBEXEC_LINKS),yes)
define install_post_hook
install -d $(DestDir)$(LibExecDir)/ccache
cd $(DestDir)$(LibExecDir)/ccache && \
for x in cc gcc clang g++ c++ llvm-gcc llvm-g++ ; do \
	ln -sf ../../bin/ccache $$x ; done
endef
endif

define test_inner_hook
$(BinDir)/ccache --version | grep $(Version)
endef
