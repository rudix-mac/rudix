BuildRequires += $(BinDir)/pcre-config # static-pcre

include ../../Library/Configure.mk

Title=		Nginx
Name=		nginx
Version=	1.2.1
Revision=	0
URL=		http://nginx.org/download/
Source=		$(Name)-$(Version).tar.gz

ReadMeFile=	$(SourceDir)/README
LicenseFile=	$(SourceDir)/LICENSE

ConfigureExtra += --prefix=$(DataDir)/nginx
ConfigureExtra += --sbin-path=$(BinDir)/nginx
ConfigureExtra += --conf-path=$(SysConfDir)/nginx/nginx.conf
ConfigureExtra += --error-log-path=$(LocalStateDir)/log/nginx/error.log
ConfigureExtra += --http-log-path=$(LocalStateDir)/log/nginx/access.log
ConfigureExtra += --pid-path=$(LocalStateDir)/run/nginx.pid
ConfigureExtra += --lock-path=$(LocalStateDir)/run/nginx.lck
ConfigureExtra += --with-ipv6 
ConfigureExtra += --with-http_ssl_module
## Currently file AIO is supported on FreeBSD 4.3+ and Linux 2.6.22+ only
#ConfigureExtra +=  --with-file-aio

# http://wiki.nginx.org/InstallOptions
# Valid for FreeBSD and MacOSX
ConfigureExtra += --with-ld-opt="-L /usr/local/lib"
ConfigureExtra += --with-cc-opt="-I /usr/local/include"

define install_post_hook
rm -f $(InstallDir)/$(SBinDir)/nginx.old
rm -f $(InstallDir)/$(SysConfDir)/nginx/{fastcgi.conf,fastcgi_params,mime.types,nginx.conf,scgi_params,uwsgi_params}
mv $(InstallDir)/$(DataDir)/nginx/html/index.html $(InstallDir)/$(DataDir)/nginx/html/index.html.default
mv $(InstallDir)/$(DataDir)/nginx/html/50x.html $(InstallDir)/$(DataDir)/nginx/html/50x.html.default
endef

define test_inner_hook
endef

define test_inner_hook
$(BinDir)/nginx -v
endef
