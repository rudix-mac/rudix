include ../../Library/Custom.mk

Title=		Jython
Name=		jython
Version=	2.7
Site=		http://www.jython.org/
Source=		http://search.maven.org/remotecontent?filepath=org/python/jython-installer/$(Version)/jython-installer-$(Version).jar
License=	Python License

ReadMeFile=	$(DestDir)$(LibDir)/jython-$(Version)/README.txt
LicenseFile=	$(DestDir)$(LibDir)/jython-$(Version)/LICENSE.txt

define prep_hook
endef

define install_hook
java -jar jython-installer-$(Version)-b1.jar \
	-s -d $(InstallDir)/$(LibDir)/jython-$(Version)
$(install_base_documentation)
install -d $(InstallDir)/$(BinDir)
cd $(InstallDir)/$(BinDir) ; ln -sf ../lib/jython-$(Version)/bin/jython .
endef

define test_hook
$(BinDir)/jython --version
endef
