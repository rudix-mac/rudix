include ../../Library/Rudix.mk

Title=		Clojure
Name=		clojure
Version=	1.5.1
Revision=	0
Site=		http://clojure.org/
Source=		http://repo1.maven.org/maven2/org/clojure/clojure/$(Version)/$(Name)-$(Version).zip
License=	Eclipse Public License

ReadMeFile=	$(SourceDir)/readme.txt
LicenseFile=	$(SourceDir)/epl-v10.html

define install_inner_hook
install -d $(DestDir)$(LibDir)/clojure-$(Version)
install -m 644 $(SourceDir)/{*.xml,changes.md,*.jar,clojure.iml} \
	$(DestDir)$(LibDir)/clojure-$(Version)
install -d $(InstallDir)/$(BinDir)
sed "s/@VERSION@/$(Version)/g" clojure.sh >$(InstallDir)/$(BinDir)/clojure
chmod +x $(InstallDir)/$(BinDir)/clojure
$(install_base_documentation)
endef

define test_inner_hook
echo '(println "Hello World!")' | $(BinDir)/clojure
endef
