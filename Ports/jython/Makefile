include ../../Library/Rudix.mk

Title=		Jython
Name=		jython
Version=	2.7
Revision=	0
Site=		http://www.jython.org/
URL=		http://search.maven.org/remotecontent?filepath=org/python/jython-installer/$(Version)-b1
Source=		jython-installer-$(Version)-b1.jar
License=	Python License

ReadMeFile=	$(DestDir)$(LibDir)/jython-$(Version)/README.txt
LicenseFile=	$(DestDir)$(LibDir)/jython-$(Version)/LICENSE.txt

define prep_inner_hook
endef

define install_inner_hook
java -jar jython-installer-$(Version)-b1.jar \
	-s -d $(InstallDir)/$(LibDir)/jython-$(Version)
$(install_base_documentation)
install -d $(InstallDir)/$(BinDir)
cd $(InstallDir)/$(BinDir) ; ln -sf ../lib/jython-$(Version)/bin/jython .
endef

define test_inner_hook
$(BinDir)/jython --version
endef
