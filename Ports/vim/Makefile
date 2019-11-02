include ../../Library/GNU.mk

Title=		Vim
Name=		vim
Version=	8.1.2238
Site=		https://www.vim.org
Source=		https://github.com/vim/vim/archive/v$(Version).tar.gz
License=	Charityware

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	LICENSE

define test_hook
$(BinDir)/vim --version | grep $(Version)
endef
