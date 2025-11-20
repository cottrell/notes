.PHONY: install serve build clean watch

all:
	cat Makefile

install:
	./install.sh

dev:
	# Bind both the site and livereload to all interfaces so other LAN devices can reach it.
	bundle exec jekyll serve --baseurl="" --watch --drafts --host=0.0.0.0 --port=4000 --livereload --livereload-host=0.0.0.0 --livereload-port=35729

serve:
	bundle exec jekyll serve --baseurl="" --watch --drafts --host=0.0.0.0 --port=4000 --livereload --livereload-host=0.0.0.0 --livereload-port=35729

build:
	bundle exec jekyll build

clean:
	bundle exec jekyll clean
