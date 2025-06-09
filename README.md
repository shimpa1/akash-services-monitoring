Helm chart for installing fluent-bit logs collector.

To install:

```
git clone https://github.com/shimpa1/akash-services-monitoring
cd akash-services-monitoring
helm install --create-namespace akash-services-monitoring -n monitoring --set clusterName=<your-cluster-name> --set lokiHost=<your-target-ip> .
```

To uninstall:

```
helm uninstall -n monitoring akash-services-monitoring
```
