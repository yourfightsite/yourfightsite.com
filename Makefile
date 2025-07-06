.PHONY: build serve

build:
	docker build --no-cache --tag yourfightsite:latest .

serve:
	docker run --name yourfightsite --publish 80:4000 --rm --tty --volume $(shell pwd):/usr/src/app --workdir /usr/src/app yourfightsite:latest
