
create-cluster:
	@echo Creating cluster...
	@kind create cluster --image kindest/node:v1.34.0 --wait 1m

crossplane:
	@echo Deploying crossplane...
	@helm upgrade --install crossplane crossplane --repo https://charts.crossplane.io/stable \
		--version 2.0.2 \
		--namespace crossplane --create-namespace \
		--wait \
		--timeout 15m \
		--atomic

crossplane-helm: crossplane
	@echo Deploying crossplane-helm...
	@kubectl apply -n crossplane -f ./demo-cluster/manifests/platform/crossplane-helm/
	@echo Waiting...
	@kubectl wait -n crossplane --for=condition=Installed providers.v1.pkg.crossplane.io/provider-helm
	@kubectl wait -n crossplane --for=condition=Healthy providers.v1.pkg.crossplane.io/provider-helm

crossplane-db: crossplane-helm
	@echo Deploying crossplane-db...
	@kubectl apply -n crossplane -f ./demo-cluster/manifests/platform/crossplane-db/

all: crossplane
all: crossplane-helm
all: crossplane-db
