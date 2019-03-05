include ../../Library/Custom.mk

Title=		Clojure
Name=		clojure
Version=	1.8.0
Site=		http://clojure.org/
Source=		http://repo1.maven.org/maven2/org/clojure/clojure/$(Version)/$(Name)-$(Version).zip
License=	Eclipse Public License

ReadMeFile=	$(SourceDir)/readme.txt
LicenseFile=	$(SourceDir)/epl-v10.html

define install_hook
install -d $(DestDir)$(LibDir)/clojure-$(Version)
install -m 644 $(SourceDir)/{*.xml,changes.md,*.jar,clojure.iml} \
	$(DestDir)$(LibDir)/clojure-$(Version)
install -d $(DestDir)$(BinDir)
sed "s_@LIBDIR@_$(LibDir)_g ; s/@VERSION@/$(Version)/g" \
	clojure.sh >$(DestDir)$(BinDir)/clojure
chmod +x $(DestDir)$(BinDir)/clojure
$(install_base_documentation)
endef

define test_hook
echo '(println "Hello World!")' | $(BinDir)/clojure
endef
