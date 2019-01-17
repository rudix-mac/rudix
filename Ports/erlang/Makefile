include ../../Library/GNU.mk

Title=		Erlang/OTP
Name=		erlang
Version=	19.2
Site=		http://www.erlang.org/
Source=		http://www.erlang.org/download/otp_src_$(Version).tar.gz
License=	Apache License

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/LICENSE.txt

UncompressedName=otp_src_$(Version)

define after_retrieve_hook
$(fetch) http://www.erlang.org/download/otp_doc_html_$(Version).tar.gz
$(fetch) http://www.erlang.org/download/otp_doc_man_$(Version).tar.gz
endef

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

realdistclean: distclean
	rm -f retrieve $(Source)
	rm -f otp_doc_html_$(Version).tar.gz
	rm -f otp_doc_man_$(Version).tar.gz
