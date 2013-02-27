include ../../Library/GNU.mk

Title=		Vim
Name=		vim
Version=	7.3
Revision=	0
URL=		ftp://ftp.vim.org/pub/vim/unix
Source=		$(Name)-$(Version).tar.bz2
UncompressedName=vim73

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	LICENSE

define test_inner_hook
$(BinDir)/vim --version | grep $(Version)
endef
