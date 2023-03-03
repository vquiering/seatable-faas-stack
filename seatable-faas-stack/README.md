# seatable-faas-stack

![Version: 1.0.1](https://img.shields.io/badge/Version-1.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 2.2.2](https://img.shields.io/badge/AppVersion-2.2.2-informational?style=flat-square)

The FAAS Scheduler is a component of SeaTable’s execution environment for Python scripts. The FAAS Scheduler handles requests, schedules jobs, saves and counts the results of script runs. Please see the SeaTable Manual for installation and upgrade instructions.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| global.database.password | string | `""` | password for the seatable-faas-scheduler database, if database pod is not used, this is the database used in the scheduler to connect to your custom database |
| global.fullnameOverride | string | `""` |  |
| global.globalPodAnnotations | object | `{}` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `"nginx"` |  |
| ingress.domain | string | `"seatable-faas-scheduler.example.com"` |  |
| ingress.enabled | bool | `false` |  |
| ingress.tls | list | `[]` |  |
| seatableFaasScheduler.affinity | object | `{}` |  |
| seatableFaasScheduler.config.dbHost | string | `""` | leave dbHost emtpy to use deployed pod |
| seatableFaasScheduler.config.runnerUrl | string | `""` | leave runnerUrl emtpy to use deployed pod |
| seatableFaasScheduler.config.serviceToken | string | `""` | base64 encoded passphrase string leave emtpy to let it autocreate get the created token from /opt/seatable-faas-scheduler/conf/seatable_faas_scheduler_settings.py afterwards |
| seatableFaasScheduler.config.serviceUrl | string | `""` | URL of your seatable server |
| seatableFaasScheduler.config.timezone | string | `""` | leave timezone empty for UTC |
| seatableFaasScheduler.image.pullPolicy | string | `"IfNotPresent"` |  |
| seatableFaasScheduler.image.repository | string | `"vqui/seatable-faas-scheduler"` | image to use |
| seatableFaasScheduler.image.tag | string | `"2.2.2"` |  |
| seatableFaasScheduler.imagePullSecrets | list | `[]` |  |
| seatableFaasScheduler.nameOverride | string | `"seatable-faas-scheduler"` |  |
| seatableFaasScheduler.nodeSelector | object | `{}` |  |
| seatableFaasScheduler.persistence.enabled | bool | `true` |  |
| seatableFaasScheduler.persistence.size | string | `"10Gi"` |  |
| seatableFaasScheduler.persistence.storageClass | string | `""` |  |
| seatableFaasScheduler.podAnnotations | object | `{}` |  |
| seatableFaasScheduler.podSecurityContext | object | `{}` |  |
| seatableFaasScheduler.replicaCount | int | `1` | how many scheduler are deployed behind the ingress (not tested in a production environment) |
| seatableFaasScheduler.resources | object | `{}` |  |
| seatableFaasScheduler.securityContext | object | `{}` |  |
| seatableFaasScheduler.tolerations | list | `[]` |  |
| seatableFaasSchedulerDb.affinity | object | `{}` |  |
| seatableFaasSchedulerDb.config.mariadbAutoUpdate | bool | `true` | use mariadb auto update feature |
| seatableFaasSchedulerDb.enabled | bool | `true` | disable if you use a different db |
| seatableFaasSchedulerDb.image.pullPolicy | string | `"IfNotPresent"` |  |
| seatableFaasSchedulerDb.image.repository | string | `"mariadb"` |  |
| seatableFaasSchedulerDb.image.tag | string | `"10.11"` |  |
| seatableFaasSchedulerDb.imagePullSecrets | list | `[]` |  |
| seatableFaasSchedulerDb.nameOverride | string | `"seatable-faas-scheduler-db"` |  |
| seatableFaasSchedulerDb.nodeSelector | object | `{}` |  |
| seatableFaasSchedulerDb.persistence.enabled | bool | `true` | enable persistence if needed |
| seatableFaasSchedulerDb.persistence.size | string | `"10Gi"` |  |
| seatableFaasSchedulerDb.persistence.storageClass | string | `""` |  |
| seatableFaasSchedulerDb.podAnnotations | object | `{}` |  |
| seatableFaasSchedulerDb.podSecurityContext | object | `{}` |  |
| seatableFaasSchedulerDb.resources | object | `{}` |  |
| seatableFaasSchedulerDb.securityContext | object | `{}` |  |
| seatableFaasSchedulerDb.tolerations | list | `[]` |  |
| seatablePythonRunner.affinity | object | `{}` |  |
| seatablePythonRunner.config.runnerImage | string | `"seatable/python-runner:latest"` | if you use a custom image, set it it here |
| seatablePythonRunner.config.schedulerUrl | string | `""` | leave schedulerUrl empty for deployed pod |
| seatablePythonRunner.dind.enabled | bool | `true` | leave this enabled if you are running in k8s |
| seatablePythonRunner.dind.image.pullPolicy | string | `"IfNotPresent"` |  |
| seatablePythonRunner.dind.image.repository | string | `"docker"` | set a different service image if needed |
| seatablePythonRunner.dind.image.tag | string | `"23.0.0-dind"` |  |
| seatablePythonRunner.dind.imagePullSecrets | list | `[]` |  |
| seatablePythonRunner.dind.nameOverride | string | `""` |  |
| seatablePythonRunner.dind.resources | object | `{}` |  |
| seatablePythonRunner.enabled | bool | `true` | disable if you use a different seatable-python-runner |
| seatablePythonRunner.image.pullPolicy | string | `"IfNotPresent"` |  |
| seatablePythonRunner.image.repository | string | `"vqui/seatable-python-runner"` |  |
| seatablePythonRunner.image.tag | string | `"2.0.5"` |  |
| seatablePythonRunner.imagePullSecrets | list | `[]` |  |
| seatablePythonRunner.nameOverride | string | `"seatable-python-runner"` |  |
| seatablePythonRunner.nodeSelector | object | `{}` |  |
| seatablePythonRunner.podAnnotations | object | `{}` |  |
| seatablePythonRunner.podSecurityContext | object | `{}` |  |
| seatablePythonRunner.replicaCount | int | `1` |  |
| seatablePythonRunner.resources | object | `{}` |  |
| seatablePythonRunner.securityContext | object | `{}` |  |
| seatablePythonRunner.tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
