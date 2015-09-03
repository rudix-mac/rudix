include ../../Library/Configure.mk

Title=		Talloc
Name=		talloc
Version=	2.1.3
Revision=	0
Site=		http://talloc.samba.org/
Source=		http://samba.org/ftp/talloc/$(Name)-$(Version).tar.gz
License=	GPL

ReadMeFile=	README
LicenseFile=	LICENSE

ConfigureExtra += --without-gettext

define install_post_hook
install -d $(InstallDir)/$(PythonSitePackages)
mv $(InstallDir)$(LibDir)/python*/site-packages/talloc.so \
	$(InstallDir)/$(PythonSitePackages)
rm -rf $(InstallDir)$(LibDir)/python*/site-packages/
install_name_tool -id $(LibDir)/libtalloc.2.dylib \
	$(InstallDir)$(LibDir)/libtalloc.$(Version).dylib
install_name_tool -id $(LibDir)/libpytalloc-util.2.dylib \
	$(InstallDir)$(LibDir)/libpytalloc-util.$(Version).dylib
install_name_tool -change \
	$(PortDir)/$(BuildDir)/bin/default/libtalloc.dylib \
	$(LibDir)/libtalloc.2.dylib \
	$(InstallDir)$(LibDir)/libpytalloc-util.$(Version).dylib
install_name_tool -change \
	$(PortDir)/$(BuildDir)/bin/default/libpytalloc-util.dylib \
	$(LibDir)/libpytalloc-util.2.dylib \
	$(InstallDir)$(PythonSitePackages)/talloc.so
install_name_tool -change \
	$(PortDir)/$(BuildDir)/bin/default/libtalloc.dylib \
	$(LibDir)/libtalloc.2.dylib \
	$(InstallDir)$(PythonSitePackages)/talloc.so
endef

define test_inner_hook
$(Python) -c 'import talloc'
endef
