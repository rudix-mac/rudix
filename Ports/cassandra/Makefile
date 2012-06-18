include ../../Library/Config.mk
RUDIX_STRIP_PACKAGE=no
include ../../Library/Rudix.mk

Title=		Apache Cassandra
Name=		cassandra
Version=	1.1.1
Revision=	0
URL=		http://www.apache.org/dist/cassandra/apache-cassandra/$(Version)/
Source=		apache-$(Name)-$(Version)-bin.tar.gz

ReadMeFile=	$(InstallDir)/$(LibDir)/cassandra/README.txt
LicenseFile=	$(InstallDir)/$(LibDir)/cassandra/LICENSE

define install_inner_hook
install -d $(InstallDir)/usr/local/lib
tar zxf $(PortDir)/$(Source) -C $(InstallDir)/usr/local/lib
mv $(InstallDir)/usr/local/lib/apache-cassandra-$(Version) \
	$(InstallDir)/usr/local/lib/cassandra
rm -rf $(InstallDir)/$(LibDir)/cassandra/bin/linux-x86-*
install -d $(InstallDir)/$(BinDir)
cd $(InstallDir)/$(BinDir) ; ln -sf ../lib/cassandra/bin/macosx/cassandra .
mv $(InstallDir)/$(LibDir)/cassandra/conf \
	$(InstallDir)/$(LibDir)/cassandra/conf.default
mv $(InstallDir)/$(LibDir)/cassandra/webapps \
	$(InstallDir)/$(LibDir)/cassandra/webapps.default
rm -rf $(InstallDir)/$(LibDir)/cassandra/example
rm -rf $(InstallDir)/$(LibDir)/cassandra/data/*
endef

define final_inner_hook
sudo /usr/local/bin/cassandra start
sleep 10
sudo /usr/local/bin/cassandra status
sudo /usr/local/bin/cassandra stop
sleep 10
endef
