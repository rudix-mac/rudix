include ../../Library/Configure.mk

Title=		Rust Language
Name=		rust
Version=	1.0.0
Revision=	0
Site=		http://www.rust-lang.org
Source=		https://static.rust-lang.org/dist/rustc-$(Version)-src.tar.gz
License=	MIT/Apache

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/COPYRIGHT

UncompressedName=rustc-$(Version)

define test_inner_hook
$(BinDir)/rustc --version | grep $(Version)
endef
