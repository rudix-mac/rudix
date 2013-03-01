#!/usr/bin/make -f

define info_color
printf "\033[32m$1\033[0m\n"
endef

all: setup tests teardown

tests: start stop

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove tomcat6
	sudo rudix install tomcat6-*.pkg

start:
	@$(call info_color,Testing Tomcat: starting up...)
	sudo /usr/local/bin/tomcat6-startup.sh
	@$(call info_color,Done)

stop:
	$(call info_color,Testing Tomcat: shutting down...)
	sleep 60
	sudo /usr/local/bin/tomcat6-shutdown.sh
	@$(call info_color,Done)


teardown:
	sudo rudix remove tomcat6
	@$(call info_color,Finished)

.PHONY: setup teardown program
