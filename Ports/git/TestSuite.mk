#!/usr/bin/make -f

include ../../Library/Rudix.mk

all: setup tests teardown

tests: git perl python local

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove git
	sudo rudix install git-*.pkg

git:
	@$(call info_color,Testing git executable...)
	/usr/local/bin/git init

perl:
	@$(call info_color,Testing Perl module...)
	perl -e 'use Git'

python:
	@$(call info_color,Testing Python module...)
	python -c 'import git_remote_helpers'

local:
	@$(call info_color,Testing for libs in /usr/local/lib...)
	otool -L /usr/local/bin/git | grep -v '/usr/local/lib' >/dev/null

teardown:
	sudo rudix remove git
	rm -rf .git/
	$(call info_color,Finished)
