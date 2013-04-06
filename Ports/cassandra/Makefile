include ../../Library/Config.mk
RUDIX_STRIP_PACKAGE=no
include ../../Library/Rudix.mk

Title=		Apache Cassandra
Name=		cassandra
Version=	1.2.3
Revision=	0
#URL=		http://www.apache.org/dist/cassandra/apache-cassandra/$(Version)
URL=		http://www.us.apache.org/dist/cassandra/$(Version)
Source=		apache-$(Name)-$(Version)-bin.tar.gz

ReadMeFile=	$(InstallDir)$(LibDir)/cassandra/README.txt
LicenseFile=	$(InstallDir)$(LibDir)/cassandra/LICENSE.txt

UncompressedName=apache-cassandra-$(Version)

define install_inner_hook
install -d $(InstallDir)$(LibDir)
tar zxf $(PortDir)/$(Source) -C $(InstallDir)$(LibDir)
mv $(InstallDir)$(LibDir)/apache-cassandra-$(Version) \
	$(InstallDir)$(LibDir)/cassandra
rm -rf $(InstallDir)$(LibDir)/cassandra/bin/linux-x86-*
install -d $(InstallDir)$(BinDir)
cd $(InstallDir)/$(BinDir) ; ln -sf ../lib/cassandra/bin/cassandra .
mv $(InstallDir)/$(LibDir)/cassandra/conf \
	$(InstallDir)$(LibDir)/cassandra/conf.default
#mv $(InstallDir)/$(LibDir)/cassandra/webapps \
#	$(InstallDir)$(LibDir)/cassandra/webapps.default
rm -rf $(InstallDir)$(LibDir)/cassandra/example
rm -rf $(InstallDir)$(LibDir)/cassandra/data/*
endef

define test_inner_hook
sudo $(BinDir)/cassandra start
sleep 15
sudo $(BinDir)/cassandra status
sudo $(BinDir)/cassandra stop
endef
