## Usage

[Helm](https://helm.sh) must be installed to use the charts.  Please refer to
Helm's [documentation](https://helm.sh/docs) to get started.

Once Helm has been set up correctly, add the repo as follows:

    helm repo add codebuds https://denniscodebuds.github.io/helm-charts

If you had already added this repo earlier, run `helm repo update` to retrieve
the latest versions of the packages.  You can then run `helm search repo
codebuds` to see the charts.

To install the deno-webserver chart:

    helm install my-deno-webserver codebuds/deno-webserver

To uninstall the chart:

    helm delete my-deno-webserver

## Charts

### sf-log-server
- 0.4.1 : Add default values for *serviceAccount* and *autoscaling*
- 0.4.0 : Update docker image version
- 0.3.0 : Add Ingress
- 0.2.0 :
    - update micro-symfony-kernel to 0.1.2
    - Set mariaDB to StatefulSet
    - Add helper for MariaDB env vars
- 0.1.0 : A symfony 6 server and a MariaDB server.
    - Keep track of all visits
    - Add a PVC 
    - Use InitContainers to check Database state and set PVC rights on mountPaths

### deno-webserver
- 0.3.1 : Update deno docker image to 1.5.1
- 0.3.1 : Remove unused values
- 0.3.0 : Add mariaDB deployement
- 0.2.0 : Add volumes
- 0.1.0 : Init deno webserver keeping logs
