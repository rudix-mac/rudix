include ../../Library/GNU.mk

Title=		Vim
Name=		vim
Version=	8.2.1845
Site=		https://www.vim.org
Source=		https://github.com/vim/vim/archive/v8.2.1845.tar.gz
License=	Vim License

ReadMeFile=	$(SourceDir)/README.txt
LicenseFile=	LICENSE

define test_hook
$(BinDir)/vim --version | grep 8.2
endef
