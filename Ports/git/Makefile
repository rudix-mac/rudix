BuildRequires += $(LibDir)/libintl.la # static-gettext

include ../../Library/GNU.mk

ifeq ($(OSXVersion),10.8)
PythonVersion=2.7
PerlVersion=5.12.4
endif
ifeq ($(OSXVersion),10.7)
PythonVersion=2.7
PerlVersion=5.12.3
endif
ifeq ($(OSXVersion),10.6)
PythonVersion=2.6
PerlVersion=5.10.0
endif

Title=		Git
Name=		git
Version=	1.8.3.1
Site=		http://git-scm.com/
Source=		http://git-core.googlecode.com/files/$(Name)-$(Version).tar.gz
License=	GPL

define retrieve_post_hook
$(fetch) http://git-core.googlecode.com/files/git-manpages-$(Version).tar.gz
endef

ifeq ($(RUDIX_BUILD_WITH_STATIC_LIBS),yes)
LdFlags += -framework CoreFoundation -liconv
endif

define install_post_hook
# Fix Perl module position
install -d $(InstallDir)/Library/Perl/Updates/$(PerlVersion)
mv $(InstallDir)$(LibDir)/perl5/site_perl/*.pm \
	$(InstallDir)/Library/Perl/Updates/$(PerlVersion)
# Fix Python module position
install -d $(InstallDir)/Library/Python/$(PythonVersion)
mv $(InstallDir)$(LibDir)/python$(PythonVersion)/site-packages \
	$(InstallDir)/Library/Python/$(PythonVersion)
rmdir $(InstallDir)$(LibDir)/python$(PythonVersion)
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
	rm -f retrieve $(shell basename $(Source)) git-manpages-$(Version).tar.gz
