IMAGE=dvitali/slidev
TAG=latest

NAME=clis-everywhere
PRES_IMAGE=dvitali/$(NAME)
PRES_TAG=latest

docker-build-base:
	docker build \
		-t "$(IMAGE):$(TAG)" \
		.

docker-run-base:
	docker run \
		--rm \
		-it \
		--entrypoint=/bin/bash \
		--name slides-development \
		-v "$$PWD:/app" \
		-p 3030:3030 \
		"$(IMAGE):$(TAG)"

docker-build:
	docker build \
		-t "$(PRES_IMAGE):$(PRES_TAG)" \
		-f "Dockerfile.build" \
		.

docker-run:
	docker run \
		--rm \
		-it \
		--name "$(NAME)" \
		-p 8080:80 \
		"$(PRES_IMAGE):$(PRES_TAG)"

docker-push:
	docker push "$(PRES_IMAGE):$(PRES_TAG)"