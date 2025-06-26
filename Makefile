.PHONY: install serve build clean watch

all:
	cat Makefile

install:
	bundle install

dev:
	bundle exec jekyll serve --baseurl="" --watch --livereload --host=0.0.0.0 --drafts

serve:
	bundle exec jekyll serve --baseurl="" --watch --livereload --host=0.0.0.0

build:
	bundle exec jekyll build

watch:
	bundle exec jekyll serve --baseurl="" --watch --livereload --drafts

clean:
	bundle exec jekyll clean

dev: watch
