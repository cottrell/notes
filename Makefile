.PHONY: install serve build clean watch

all:
	cat Makefile

install:
	./install.sh

dev:
	# Bind both the site and livereload to all interfaces (IPv4 and IPv6) so other LAN devices can reach it.
	bundle exec jekyll serve --baseurl="" --watch --drafts --host=:: --port=4000 --livereload --livereload-port=35729

serve:
	# Bind both the site and livereload to all interfaces (IPv4 and IPv6) so other LAN devices can reach it.
	bundle exec jekyll serve --baseurl="" --watch --drafts --host=:: --port=4000 --livereload --livereload-port=35729

build:
	bundle exec jekyll build

clean:
	bundle exec jekyll clean
