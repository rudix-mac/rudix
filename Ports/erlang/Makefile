include ../../Library/GNU.mk
ifeq ($(OSXVersion),10.6)
RUDIX_UNIVERSAL=no
endif

Title=		Erlang/OTP
Name=		erlang
Version=	17.4
Revision=	0
Site=		http://www.erlang.org/
URL=		http://www.erlang.org/download/
Source=		otp_src_$(Version).tar.gz
License=	EPL

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/EPLICENCE

UncompressedName=otp_src_$(Version)

define retrieve_post_hook
$(fetch) $(URL)/otp_doc_html_$(Version).tar.gz
$(fetch) $(URL)/otp_doc_man_$(Version).tar.gz
endef

ifneq ($(OSXVersion),10.6)
GnuConfigureExtra += --enable-darwin-64bit
endif

define install_post_hook
tar -zxf $(PortDir)/otp_doc_man_$(Version).tar.gz -C \
	$(InstallDir)/$(LibDir)/erlang
tar -zxf $(PortDir)/otp_doc_html_$(Version).tar.gz -C \
	$(InstallDir)/$(LibDir)/erlang
install -d $(InstallDir)/$(DocDir)/$(Name)
endef

define test_inner_hook
$(BinDir)/erlc
$(BinDir)/erl -version
endef

realdistclean: distclean
	rm -f retrieve $(Source)
	rm -f otp_doc_html_$(Version).tar.gz
	rm -f otp_doc_man_$(Version).tar.gz
