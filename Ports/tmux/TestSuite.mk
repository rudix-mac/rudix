#!/usr/bin/make -f

include ../../Library/Rudix.mk

all: setup tests teardown

tests: tmux

setup:
	@$(call info_color,Starting tests)
	sudo rudix remove tmux
	sudo rudix install tmux-*.pkg

tmux:
	@$(call info_color,Testing tmux program...)
	/usr/local/bin/tmux -c true
	@$(call info_color, Done)

teardown:
	sudo rudix remove tmux
	@$(call info_color,Finished)
