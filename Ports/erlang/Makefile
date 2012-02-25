include ../../Library/Config.mk
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		Erlang/OTP
Name=		erlang
Version=	R15B
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

ifdef FOO
build: prep
	cd $(SourceDir) ; $(configure) \
		--disable-dependency-tracking \
		--enable-kernel-poll \
		--enable-smp-support \
		--enable-hipe \
		--enable-darwin-universal ; make
	touch build

install: build
	cd $(SourceDir) ; make INSTALL_PREFIX=$(InstallDir) install
	install -d $(InstallDir)$(Prefix)/share
	tar -zxf $(PortDir)/otp_doc_man_$(Version).tar.gz -C $(InstallDir)$(Prefix)/share
	tar -zxf $(PortDir)/otp_doc_html_$(Version).tar.gz -C $(InstallDir)$(LibDir)/erlang
	install -d $(InstallDir)/$(DocDir)/$(Name)
	install -m 644 $(SourceDir)/{AUTHORS,EPLICENCE,ReadMeFile.*} $(InstallDir)/$(DocDir)/$(Name)
	cd $(InstallDir)/$(DocDir)/$(Name) ; ln -sf ../../../lib/erlang/doc html
	cd $(InstallDir)$(LibDir)/erlang ; ln -sf ../../share/man .
	rm -f $(InstallDir)$(Prefix)/share/{COPYRIGHT,PR.template,ReadMeFile}
	touch install

test: install
	$(test-universal-binary) "$(InstallDir)$(LibDir)/erlang/bin/*"
	touch test

realdistclean: distclean
	rm -f retrieve $(Source)
	rm -f otp_doc_html_$(Version).tar.gz
	rm -f otp_doc_man_$(Version).tar.gz
endif
