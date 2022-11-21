build:
	docker build -t spyserver -f Dockerfile .

run:
	docker run -it --rm \
	-e LIST_IN_DIRECTORY=0 \
	spyserver

buildx:
	docker buildx build --platform linux/arm/v7,linux/amd64 -t lloydpick/spyserver --push .

.PHONY: build
