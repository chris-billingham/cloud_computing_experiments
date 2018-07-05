library(tidyverse)

library(googleComputeEngineR)

project <- "r-topic-modelling"
zone <- "europe-west1-b"

Sys.setenv(GCE_AUTH_FILE = "auth.json",
           GCE_DEFAULT_PROJECT_ID = project,
           GCE_DEFAULT_ZONE = zone)

#europe-west1-b

gce_auth()

gce_global_project(project)
gce_global_zone(zone)

default_project <- gce_get_project("r-topic-modelling")
default_project$name


vm <- gce_vm(template = "rstudio",
             name = "r-stm-v1",
             username = "chris", 
             password = "lyra3107")


vm <- gce_vm(template = "rstudio",
             name = "r-data-science",
             username = "chris", 
             password = "lyra3107",
             predefined_type = "n1-standard-2")

vm2 <- gce_vm(template = "rstudio",
             name = "r-stm-v2",
             username = "chris", 
             password = "lyra3107")

vm5 <- gce_vm(template = "rstudio",
             name = "r-stm-v5",
             username = "chris", 
             password = "lyra3107",
             predefined_type = "n1-standard-1")

vm4 <- gce_vm(template = "rstudio",
             name = "r-stm-v4",
             username = "chris", 
             password = "lyra3107",
             predefined_type = "n1-highmem-2")

my_rstudio <- gce_vm("r-topic-modelling")

job <- gce_vm_stop("r-stm-v6")
job <- gce_vm_stop("r_stm_v3")
job <- gce_vm_stop("r_stm_v4")

job <- gce_vm_start("r-topic-modelling")


gce_list_instances()

gce_push_registry(vm5, 
                  save_name = "stm_rstudio",
                  container_name = "rstudio")

## construct the correct tag name for your custom image
tag <- gce_tag_container("stm_rstudio")

## start a 50GB RAM instance
vmc <- gce_vm(name = "rstudio-dsci",
              predefined_type = "n1-highmem-2",
              template = "rstudio",
              dynamic_image = gce_tag_container("rocker-dsci", project = "r-topic-modelling"),
              username = "chris", password = "lyra3107")


gcr.io/r-topic-modelling/rocker-dsci