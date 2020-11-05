# custom image

resource "google_compute_image" "bootable-image" {
name     = "terra-image"
project  = "${var.project-name}"

raw_disk {
source   = "https://storage.googleapis.com/bosh-cpi-artifacts/bosh-stemcell-3262.4-google-kvm-ubuntu-trusty-go_agent-raw.tar.gz"
#source    = "ubuntu-os-cloud/ubuntu-1804-lts"
#boot      = "true"
}
guest_os_features {
type     = "SECURE_BOOT"
}
}
