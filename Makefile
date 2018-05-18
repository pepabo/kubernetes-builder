KUBERNETES_VERSION := v1.9.5
REGISTRY := docker.io/rtakaishi

fetch:
	KUBERNETES_VERSION=$(KUBERNETES_VERSION) ./scripts/fetch.sh

patch:
	./scripts/patch.sh

build:
	cd ./kubernetes; KUBE_FASTBUILD=true ARCH=amd64 ./build/run.sh make cross

push: build
	cd ./kubernetes/cluster/images/hyperkube; REGISTRY=$(REGISTORY) VERSION=$(KUBERNETES_VERSION) ARCH=amd64 make push