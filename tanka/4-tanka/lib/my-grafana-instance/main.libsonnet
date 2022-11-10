local d = (import 'doc-util/main.libsonnet');
local k = import 'k.libsonnet';
local kausal = (import 'ksonnet-util/kausal.libsonnet');
local container = k.core.v1.container;
local containerPort = k.core.v1.containerPort;


{
  '#': d.pkg(
    name='my-grafana-instance',
    url='my.domain.com',
    help='`my-grafana-instance` helps to abstract a grafana instance',
  ),


  '#new': d.fn(
    '`new` creates a new deployment and service for grafana',
    [d.arg('name', d.T.string)]
  ),
  new(name): { // <-- here
    // k.core.v1.container.new(name="foo", image="foo/bar")
    container::
      container.new(name='grafana', image='grafana/grafana')
      + container.withPorts([
        // { name: ui, containerPort: 3000 } // is an anti-pattern
        containerPort.new(3000)
        + containerPort.withName('http'),
      ])
    ,

    // inherit name from function argument
    deployment: k.apps.v1.deployment.new(name, containers=[self.container]),

    // create service
    service: kausal.util.serviceFor(self.deployment),
  },

  '#withImage': d.fn(
    '`withImage` overrides the container image',
    [d.arg('name', d.T.string)]
  ),
  withImage(image): {
    container+:: container.withImage(image)
  }
}
