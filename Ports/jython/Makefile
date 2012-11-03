include ../../Library/Config.mk
include ../../Library/Rudix.mk

Title=		Jython
Name=		jython
Version=	2.7a2
Revision=	0
URL=		http://sourceforge.net/projects/jython/files/jython-dev/2.7.0a2/
Source=		jython_installer-$(Version).jar

ReadMeFile=	$(InstallDir)/$(LibDir)/jython-$(Version)/README.txt
LicenseFile=	$(InstallDir)/$(LibDir)/jython-$(Version)/LICENSE.txt

define prep_inner_hook
endef

define install_inner_hook
java -jar jython_installer-$(Version).jar \
	-s -d $(InstallDir)/$(LibDir)/jython-$(Version)
$(install_base_documentation)
install -d $(InstallDir)/$(BinDir)
cd $(InstallDir)/$(BinDir) ; ln -sf ../lib/jython-$(Version)/bin/jython .
endef

define test_inner_hook
$(BinDir)/jython --version
endef
