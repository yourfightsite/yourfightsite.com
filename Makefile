.PHONY: build deploy serve

build:
	docker run --rm --tty --volume $(shell pwd):/usr/src/app --workdir /usr/src/app node:22 npm install
	cp -r node_modules/bootstrap/dist/js/bootstrap.bundle.min.* js/
	docker build --no-cache --tag yourfightsite:latest .

deploy:
	npm ci
	cp -r node_modules/bootstrap/dist/js/bootstrap.bundle.min.* js/
	bundle exec jekyll build

serve:
	docker run --name yourfightsite --publish 80:4000 --rm --tty --volume $(shell pwd):/usr/src/app --workdir /usr/src/app yourfightsite:latest
