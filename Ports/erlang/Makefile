include ../../Library/GNU.mk
ifeq ($(OSXVersion),10.6)
RUDIX_UNIVERSAL=no
endif

Title=		Erlang/OTP
Name=		erlang
Version=	R16B
Revision=	0
URL=		http://www.erlang.org/download/
Source=		otp_src_$(Version).tar.gz

UncompressedName=otp_src_$(Version)

ReadMeFile=	$(SourceDir)/README.md
LicenseFile=	$(SourceDir)/EPLICENCE

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
$(BinDir)/erl -version
endef

realdistclean: distclean
	rm -f retrieve $(Source)
	rm -f otp_doc_html_$(Version).tar.gz
	rm -f otp_doc_man_$(Version).tar.gz
