BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		Git
Name=		git
Version=	1.7.11
Revision=	0
URL=		http://git-core.googlecode.com/files/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/COPYING

define retrieve_post_hook
$(fetch) $(URL)/git-manpages-$(Version).tar.gz
endef

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv
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
# App
rm -rf $(InstallDir)/Applications/
endef

define test_inner_hook
$(BinDir)/git --version
perl -e 'use Git'
python -c 'import git_remote_helpers'
endef
