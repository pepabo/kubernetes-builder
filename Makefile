KUBERNETES_VERSION := v1.12.9
VERSION := v1.12.9.1
REGISTRY := docker.io/rtakaishi

fetch:
	KUBERNETES_VERSION=$(KUBERNETES_VERSION) ./scripts/fetch.sh

patch: clean fetch
	./scripts/patch.sh $(KUBERNETES_VERSION)

build: patch
	cd ./kubernetes; KUBE_FASTBUILD=true ARCH=amd64 ./build/run.sh make

push:
	cd ./kubernetes/cluster/images/hyperkube; REGISTRY=$(REGISTRY) VERSION=$(VERSION) ARCH=amd64 make push

clean:
	cd ./kubernetes && git reset --hard HEAD && git clean -fd