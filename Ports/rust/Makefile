include ../../Library/Configure.mk

Title=		Rust
Name=		rust
Version=	0.6
Revision=	0
URL=		http://static.rust-lang.org/dist
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/COPYRIGHT

define test_inner_hook
$(BinDir)/rust --help
endef
