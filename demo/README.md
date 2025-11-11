# Build it!

## We wanna use Kubernetes

```bash
kind create cluster --image kindest/node:v1.34.0 --wait 1m --config - <<EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
EOF
```

## We deploy with ArgoCD

```bash
helm upgrade --install argocd argo-cd --repo https://argoproj.github.io/argo-helm \
  --namespace argocd --create-namespace \
  --wait \
  --timeout 15m \
  --atomic \
  --values - <<EOF
global:
  logging:
    format: json

configs:
  rbac:
    create: true
    scopes: '[email,groups]'
    policy.default: role:readonly
    policy.csv: |
      p, role:readonly, applications, get, */*, allow
      p, role:admin, applications, *, */*, allow

applicationSet:
  replicas: 1
      
controller:
  extraArgs:
    - --app-resync=20
  replicas: 1
  enableStatefulSet: true
  logFormat: json

redis-ha:
  enabled: false
  
repoServer:
  logFormat: json
  logLevel: "warn"

server:
  extraArgs:
    - --insecure
  service:
    type: ClusterIP
  logFormat: json
      
dex:
  enabled: false

notifications:
  enabled: false
EOF
```

## Now we have ArgoCD installed

```bash
kubectl port-forward service/argocd-server -n argocd 8080:443
```

```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```

## Let's bootstrap

```bash
k apply -f demo-cluster/apps/projects.yaml
k apply -f demo-cluster/apps/bootstrap.yaml
```

## Install crossplane (with ArgoCD)

## Install crossplane-db (with ArgoCD)

## Install crossplane-db (with ArgoCD)

# Use it!

## Devs can create their own DB now

## Show time: deploy drupal

```bash
kubectl port-forward service/drupal -n dev 8090:443
```

# Break it !

```yaml
          - name: mariadb-secret
            base:
              apiVersion: v1
              kind: Secret
              metadata:
                name: drupal-db-conn
              type: Opaque
              data:
                db-password: c3VwZXJQYXNzMTIzCg==
                # db-password: c3VwZXJQYXNzMTIzIQ==
```

# Test it !

## Locally with the underlying cluster

## Remotely in the CI job

## Now from the point of view of the developper





Quand on construit une plateforme développeur, on pense disponibilité, scalabilité, UX… mais rarement testabilité.”

Expliquer que les plateformes sont des systèmes vivants : API, pipelines, SDKs, intégrations, infrastructure mutable.

Poser le constat : la dette de confiance. “On ship vite, on ship souvent, mais sait-on encore si nos fondations tiennent ?”