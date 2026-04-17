.PHONY: all install dev serve build clean

HOST ?= ::
PORT ?= 4100
LIVERELOAD_PORT ?= 35730


all:
	cat Makefile

install:
	./install.sh

dev:
	# Bind both the site and livereload to all interfaces (IPv4 and IPv6) so other LAN devices can reach it.
	bundle exec jekyll serve --baseurl="" --watch --drafts --host=:: --port=$(PORT) --livereload --livereload-port=$(LIVERELOAD_PORT)

serve:
	# Bind both the site and livereload to all interfaces (IPv4 and IPv6) so other LAN devices can reach it.
	bundle exec jekyll serve --baseurl="" --watch --drafts --host=:: --port=$(PORT) --livereload --livereload-port=$(LIVERELOAD_PORT)

build:
	bundle exec jekyll build

clean:
	bundle exec jekyll clean
