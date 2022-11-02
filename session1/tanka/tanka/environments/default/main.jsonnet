local k = import 'k.libsonnet';
local kausal = (import 'ksonnet-util/kausal.libsonnet');

{
  namespace: k.core.v1.namespace.new('grafana-tanka'),

  // k.core.v1.container.new(name="foo", image="foo/bar")
  local container = k.core.v1.container,
  local containerPort = k.core.v1.containerPort,
  container::
    container.new(name='grafana', image='grafana/grafana')
    + container.withPorts([
      // { name: ui, containerPort: 3000 } // is an anti-pattern
      containerPort.new(3000)
      + containerPort.withName('http'),
    ])
  ,

  deployment: k.apps.v1.deployment.new('grafana', containers=[self.container]),

  service: kausal.util.serviceFor(self.deployment)
}
