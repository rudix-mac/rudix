include ../../Library/Config.mk
include ../../Library/Rudix.mk

Title=		Clojure
Name=		clojure
Version=	1.4.0
Revision=	0
URL=		http://repo1.maven.org/maven2/org/clojure/clojure/$(Version)
Source=		$(Name)-$(Version).zip

ReadMeFile=	$(InstallDir)/$(LibDir)/clojure-$(Version)/README.txt
LicenseFile=	$(InstallDir)/$(LibDir)/clojure-$(Version)/epl-v10.html

define prep_inner_hook
endef

define install_inner_hook
install -d $(InstallDir)/$(LibDir)
tar zxf $(Source) -C $(InstallDir)/$(LibDir)
find $(InstallDir) -type f | xargs chmod -x 
$(install_base_documentation)
install -d $(InstallDir)/$(BinDir)
sed "s/@VERSION@/$(Version)/g" clojure.sh >$(InstallDir)/$(BinDir)/clojure
chmod +x $(InstallDir)/$(BinDir)/clojure
endef

define test_inner_hook
echo '(println "Hello World!")' | $(BinDir)/clojure
endef
