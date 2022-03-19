include ../../Library/GNU.mk

Title=		Erlang/OTP
Name=		erlang
Version=	24.3.2
Site=		http://www.erlang.org/
Source=		https://github.com/erlang/otp/releases/download/OTP-$(Version)/otp_src_$(Version).tar.gz
Files+=		https://github.com/erlang/otp/releases/download/OTP-$(Version)/otp_doc_html_$(Version).tar.gz
Files+=		https://github.com/erlang/otp/releases/download/OTP-$(Version)/otp_doc_man_$(Version).tar.gz
License=	Apache License

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/LICENSE.txt

UncompressedName=otp_src_$(Version)

define after_install_hook
tar -zxf $(PortDir)/otp_doc_man_$(Version).tar.gz -C \
	$(InstallDir)/$(LibDir)/erlang
tar -zxf $(PortDir)/otp_doc_html_$(Version).tar.gz -C \
	$(InstallDir)/$(LibDir)/erlang
install -d $(InstallDir)/$(DocDir)/$(Name)
endef

define test_hook
$(BinDir)/erlc
$(BinDir)/erl -version
endef

realclean: distclean
	rm -f retrieve $(Source)
	rm -f otp_doc_html_$(Version).tar.gz
	rm -f otp_doc_man_$(Version).tar.gz
