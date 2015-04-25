include ../../Library/Configure.mk

Title=		Rust
Name=		rust
Version=	0.12.0
Revision=	0
Site=		http://www.rust-lang.org
Source=		http://static.rust-lang.org/dist/$(Name)-$(Version).tar.gz
License=	MIT/Apache

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/COPYRIGHT

define test_inner_hook
$(BinDir)/rustc --version | grep $(Version)
endef
