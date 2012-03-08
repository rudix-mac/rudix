#!/usr/bin/make -f

include ../../Library/Rudix.mk

all: setup tests teardown

tests: daemon stats

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove memcached
	sudo rudix install memcached-*.pkg

daemon:
	@$(call info_color,Testing memcached daemon...)
	/usr/local/bin/memcached -d
	@$(call info_color, Done)

stats:
	@$(call info_color,Command stats...)
	echo "stats" | nc localhost 11211
	@$(call info_color,Done)

teardown:
	killall memcached
	sudo rudix remove memcached
	@$(call info_color,Finished)
