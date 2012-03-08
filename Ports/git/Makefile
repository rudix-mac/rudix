include ../../Library/Config.mk
RUDIX_APPLY_RECOMMENDATIONS=no
include ../../Library/Rudix.mk
include ../../Library/GNUFormula.mk

Title=		Git
Name=		git
Version=	1.7.9.3
Revision=	0
URL=		http://git-core.googlecode.com/files/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define retrieve_post_hook
$(fetch) $(URL)/git-manpages-$(Version).tar.gz
endef

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += /usr/local/lib/libintl.a -liconv -framework CoreFoundation
define prep_post_hook
#perl -p -i -e s/'intl '//g $(SourceDir)/configure
endef
endif

define install_post_hook
rm -rf $(InstallDir)$(Prefix)/Library
# Place the Git application into the right folder
install -d $(InstallDir)/Applications
mv $(InstallDir)$(Prefix)/share/git-gui/lib/Git\ Gui.app \
	$(InstallDir)/Applications
# Fix Perl module position
install -d $(InstallDir)/Library/Perl/Updates/5.12.3
mv $(InstallDir)$(LibDir)/perl5/site_perl/*.pm \
	$(InstallDir)/Library/Perl/Updates/5.12.3
# Fix Python module position
install -d $(InstallDir)/Library/Python/2.7
mv $(InstallDir)$(LibDir)/python2.7/site-packages \
	$(InstallDir)/Library/Python/2.7
rmdir $(InstallDir)$(LibDir)/python2.7
# Nothing interesting is resting here
rm -rf $(InstallDir)$(LibDir)
# Manpages
install -d $(InstallDir)$(Prefix)/share/man
tar jxf $(PortDir)/git-manpages-$(Version).tar.gz \
	-C $(InstallDir)$(Prefix)/share/man
endef
