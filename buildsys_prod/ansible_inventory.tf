/**
 Generates an Ansible inventory for our hosts.
 */

resource "local_file" "ansible_inventory" {
  filename = "inventory-prod.yml"
  content  = yamlencode({
    all = {
      hosts = {
        (metal_device.arm64-builder01.network.0.address) = {}
      }
      children = {
        arm_hosts = {
          hosts = {
            (metal_device.arm64-builder01.network.0.address) = {}
          }
        }
        build_nodes = {
          hosts = {
            (metal_device.arm64-builder01.network.0.address) = {}
          }
        }
      }
    }
  })
}
