KUBERNETES_VERSION := v1.9.5
VERSION := v1.9.5.1
REGISTRY := docker.io/rtakaishi

fetch:
	KUBERNETES_VERSION=$(KUBERNETES_VERSION) ./scripts/fetch.sh

patch: clean fetch
	./scripts/patch.sh

build: patch
	cd ./kubernetes; KUBE_FASTBUILD=true ARCH=amd64 ./build/run.sh make cross

push: build
	cd ./kubernetes/cluster/images/hyperkube; REGISTRY=$(REGISTORY) VERSION=$(VERSION) ARCH=amd64 make push

clean:
	cd ./kubernetes && git reset --hard HEAD && git clean -fd