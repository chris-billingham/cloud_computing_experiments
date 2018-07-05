library(tidyverse)

library(googleComputeEngineR)

project <- "r-topic-modelling"
zone <- "europe-west1-b"

Sys.setenv(GCE_AUTH_FILE = "auth.json",
           GCE_DEFAULT_PROJECT_ID = project,
           GCE_DEFAULT_ZONE = zone)

gce_auth()

gce_global_project(project)
gce_global_zone(zone)

default_project <- gce_get_project("r-topic-modelling")
default_project$name

# start the keras super container
gce_vm_start("r-keras")

# add the instance to the variable vm-large
vm_large <- gce_vm("r-keras")

# ssh in and stop all contaiers
gce_ssh(vm_large, "docker stop $(docker ps -aq)")

# create super connection script
# investigate docker_inspect
# docker_future_install_packages
docker_start <- 'docker run -d -p 80:8787 -e USER=chris -e PASSWORD=lyra3107 gcr.io/r-topic-modelling/rocker-test'

# ssh that connection script
gce_ssh(vm_large, docker_start)

gce_ssh(vm_large, "docker container ls")

# add users

gce_rstudio_adduser(vm_large, "ian", "hipster79", container = "brave_borg")
gce_rstudio_adduser(vm_large, "rob", "england", container = "brave_borg")
gce_rstudio_adduser(vm_large, "jody", "kloppite", container = "brave_borg")
gce_rstudio_adduser(vm_large, "nick", "njholman79", container = "brave_borg")
gce_rstudio_adduser(vm_large, "phil", "nbpnash", container = "brave_borg")


