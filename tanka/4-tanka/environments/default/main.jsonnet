local k = import 'k.libsonnet';
local grafana = (import 'my-grafana-instance/main.libsonnet');

{
  namespace: k.core.v1.namespace.new('grafana-tanka'),

  instance0: grafana.new('default'),
  instance1: grafana.new('grafana-8')
             + grafana.withImage('grafana/grafana:8'),
}
