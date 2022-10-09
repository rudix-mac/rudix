include ../../Library/GNU.mk

Title=		Vim
Name=		vim
Version=	9.0.0708
Site=		https://www.vim.org
Source=		https://github.com/vim/vim/archive/refs/tags/v$(Version).tar.gz
License=	Vim License

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	$(SourceDir)/LICENSE

define test_hook
$(BinDir)/vim --version | grep 9.0
endef
