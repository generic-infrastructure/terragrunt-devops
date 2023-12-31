include "root" {
  path = find_in_parent_folders()
}

include "envcommon" {
  path   = "${dirname(find_in_parent_folders())}/_envcommon/minikube.hcl"
  expose = true
}

terraform {
  source = "${include.envcommon.locals.base_source_url}?ref=${include.envcommon.locals.ref}"
}

inputs = {
  cluster_name = "dev-local-kvm2-default"
  driver       = "kvm2"
  nodes        = 1
  cpus         = 20
  memory       = 32768
  disk_size    = 102400
  extra_disks  = 0
}
