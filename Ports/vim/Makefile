include ../../Library/GNU.mk

Title=		Vim
Name=		vim
Version=	8.1
Site=		https://www.vim.org
Source=		ftp://ftp.vim.org/pub/vim/unix/vim-$(Version).tar.bz2
License=	Charityware (GPL-compatible)
UncompressedName=vim81

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	LICENSE

define test_hook
$(BinDir)/vim --version | grep $(Version)
endef
