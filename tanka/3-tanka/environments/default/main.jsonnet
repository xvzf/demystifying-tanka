local k = import 'github.com/grafana/jsonnet-libs/ksonnet-util/kausal.libsonnet';

{
  // use locals to extract the parts we need
  local deploy = k.apps.v1.deployment,
  local container = k.core.v1.container,
  local port = k.core.v1.containerPort,
  local service = k.core.v1.service,
  // defining the objects:
  grafana: {
    // deployment constructor: name, replicas, containers
    deployment: deploy.new(name=$._config.grafana.name, replicas=1, containers=[
      // container constructor
      container.new($._config.grafana.name, 'grafana/grafana')
      + container.withPorts(  // add ports to the container
        [port.new('ui', $._config.grafana.port)]  // port constructor
      ),
    ]),

    service: k.util.serviceFor(self.deployment)
             + service.mixin.spec.withType('NodePort'),
  },
}
