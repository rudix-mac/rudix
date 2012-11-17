BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

Title=		Git
Name=		git
Version=	1.8.0
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
# FIXME: remove Git Gui.app
rm -rf $(InstallDir)$(Prefix)/share/git-gui/lib/Git\ Gui.app
# Fix Perl module position
install -d $(InstallDir)/Library/Perl/Updates/5.12.4
mv $(InstallDir)$(LibDir)/perl5/site_perl/*.pm \
	$(InstallDir)/Library/Perl/Updates/5.12.4
# Fix Python module position
install -d $(InstallDir)/Library/Python/2.7
mv $(InstallDir)$(LibDir)/python2.7/site-packages \
	$(InstallDir)/Library/Python/2.7
rmdir $(InstallDir)$(LibDir)/python2.7
# Nothing interesting is resting here
rm -rf $(InstallDir)$(LibDir)
rm -rf $(InstallDir)$(Prefix)/Library
# Install manual pages
install -d $(InstallDir)$(ManDir)
tar jxf $(PortDir)/git-manpages-$(Version).tar.gz \
	-C $(InstallDir)$(ManDir)
endef

define test_inner_hook
$(BinDir)/git --version
perl -e 'use Git'
python -c 'import git_remote_helpers'
endef

realdistclean: distclean
	rm -f retrieve $(Source) git-manpages-$(Version).tar.gz
