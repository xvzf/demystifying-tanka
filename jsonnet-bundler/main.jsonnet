local k8s = (import 'github.com/jsonnet-libs/k8s-libsonnet/1.25/main.libsonnet');

{
  deploy: k8s.apps.v1.deployment.new('test', containers=[]),
}
