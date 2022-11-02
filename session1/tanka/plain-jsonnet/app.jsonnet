local namespace = 'grafana-jsonnet';

[
  {
    apiVersion: 'v1',
    kind: 'Namespace',
    metadata: {
      name: namespace,
    },
  },
  {
    apiVersion: 'apps/v1',
    kind: 'Deployment',
    metadata: {
      name: 'grafana',
      namespace: namespace,
    },
    spec: {
      selector: {
        matchLabels: {
          name: 'grafana',
        },
      },
      template: {
        metadata: {
          labels: {
            name: 'grafana',
          },
        },
        spec: {
          containers: [
            {
              image: 'grafana/grafana',
              name: 'grafana',
              ports: [
                {
                  containerPort: 3000,
                  name: 'ui',
                },
              ],
            },
          ],
        },
      },
    },
  },
  {
    apiVersion: 'v1',
    kind: 'Service',
    metadata: {
      labels: {
        name: 'grafana',
        namespace: namespace,
      },
      name: 'grafana',
    },
    spec: {
      ports: [
        {
          name: 'grafana-ui',
          port: 3000,
          targetPort: 3000,
        },
      ],
      selector: {
        name: 'grafana',
      },
      type: 'ClusterIP',
    },
  },
]
