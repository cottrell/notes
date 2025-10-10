.PHONY: install serve build clean watch

all:
	cat Makefile

install:
	bundle install

dev:
	# NOTE: for some reason only http://0.0.0.0:4000 works
	bundle exec jekyll serve --baseurl="" --watch --livereload --drafts --host=0.0.0.0

serve:
	bundle exec jekyll serve --baseurl="" --watch --livereload --drafts --host=0.0.0.0

build:
	bundle exec jekyll build

clean:
	bundle exec jekyll clean
