include ../../Library/GNU.mk

Title=		Vim
Name=		vim
Version=	7.4
Revision=	0
Site=		http://vim.org/
URL=		ftp://ftp.vim.org/pub/vim/unix
Source=		$(Name)-$(Version).tar.bz2
License=	Charityware (GPL-compatible)
UncompressedName=vim74

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	LICENSE

define test_inner_hook
$(BinDir)/vim --version | grep $(Version)
endef
