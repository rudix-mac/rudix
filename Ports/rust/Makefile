include ../../Library/Configure.mk

Title=		Rust Language
Name=		rust
Version=	1.7.0
Site=		http://www.rust-lang.org
Source=		https://static.rust-lang.org/dist/rustc-$(Version)-src.tar.gz
License=	MIT+Apache License+BSD

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/COPYRIGHT

UncompressedName=rustc-$(Version)

define install_post_hook
rm -f $(DestDir)$(LibDir)/rustlib/install.log
sed -i.bak "s_$(DestDir)__" $(DestDir)$(LibDir)/rustlib/manifest-rustc
sed -i.bak "s_$(DestDir)__" $(DestDir)$(LibDir)/rustlib/manifest-rust-docs
rm -f $(DestDir)$(LibDir)/rustlib/*.bak
find $(DestDir)$(DocDir)/rust/html -type f | xargs chmod 644
endef

define test_hook
$(BinDir)/rustc --version | grep $(Version)
endef
