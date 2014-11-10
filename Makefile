.PHONY: build clean

REPOSITORY := $(if $(REPOSITORY),$(REPOSITORY),'grounds')
TAG 	   := $(if $(TAG),$(TAG),'latest')
IMAGE	   := $(REPOSITORY)'/droplets:'$(TAG)

build:
	docker build -t $(IMAGE) .

clean:
	docker rmi $(IMAGE)

pull:
	docker pull $(IMAGE)

push:
	docker push $(IMAGE)
