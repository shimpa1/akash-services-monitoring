Helm chart for installing fluent-bit logs collector.

To install:

```
helm install akash-services-monitoring https://github.com/shimpa1/akash-services-monitoring --set clusterName=<your-cluster-name> --set targetIp=<your-target-ip>
```

To uninstall:

```
helm uninstall akash-services-monitoring
```
