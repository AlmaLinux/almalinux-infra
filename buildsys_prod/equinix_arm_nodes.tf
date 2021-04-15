/**
 * Provisions ARM64 build nodes sponsored by Equinix Metal.
 */

provider "metal" {
  auth_token = local.tf_secrets["equinix_token"]
}

resource "metal_project_ssh_key" "ezamriy_pubkey" {
  name       = "ezamriy@cloudlinux.com"
  public_key = local.tf_secrets["ezamriy_pubkey"]
  project_id = local.tf_secrets["equinix_project_id"]
}

resource "metal_project_ssh_key" "vkleschov_pubkey" {
  name       = "vkleschov@cloudlinux.com"
  public_key = local.tf_secrets["vkleschov_pubkey"]
  project_id = local.tf_secrets["equinix_project_id"]
}

resource "metal_project_ssh_key" "vpotoropin_pubkey" {
  name       = "vpotoropin@cloudlinux.com"
  public_key = local.tf_secrets["vpotoropin_pubkey"]
  project_id = local.tf_secrets["equinix_project_id"]
}

resource "metal_device" "arm64-builder01" {
  hostname                = "arm64-builder01.almalinux.org"
  plan                    = "c2.large.arm"
  hardware_reservation_id = local.tf_secrets["equinix_arm64_builder01_reservation_id"]
  // TODO: change to AlmaLinux 8 when it is ready
  operating_system        = "centos_8"
  billing_cycle           = "hourly"
  project_id              = local.tf_secrets["equinix_project_id"]
  metro                   = local.tf_secrets["equinix_arm64_builder01_metro"]
}
