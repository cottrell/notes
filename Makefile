.PHONY: install serve build clean watch

all:
	cat Makefile

install:
	bundle install

serve:
	bundle exec jekyll serve --baseurl="" --watch --livereload

build:
	bundle exec jekyll build

watch:
	bundle exec jekyll serve --baseurl="" --watch --livereload --drafts

clean:
	bundle exec jekyll clean

dev: watch
