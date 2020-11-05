#create Subnet

resource "google_compute_subnetwork" "subnet" {
name          = "${var.name}-subnet"
provider      = "google-beta"
purpose       = "PRIVATE"
ip_cidr_range = "${var.subnet_cidr}"
network       = "${var.name}-vpc"
depends_on    = ["google_compute_network.vpc"]
region        = "${var.region}"
}
