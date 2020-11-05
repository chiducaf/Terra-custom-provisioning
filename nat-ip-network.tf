# create a public ip for nat service
resource "google_compute_address" "nat_ip" {
  name    = "nat-ip"
  project = "${var.project-name}"
  region  = "${var.region}"
}

# create a nat to allow private instances connect to internet
resource "google_compute_router" "nat-router" {
  name    = "nat-router"
  network = "${google_compute_network.vpc.name}"
}

resource "google_compute_router_nat" "nat-gateway" {
  name                               = "nat-gateway"
  router                             = "${google_compute_router.nat-router.name}"
  nat_ip_allocate_option             = "MANUAL_ONLY"
  nat_ips                            = [ google_compute_address.nat_ip.self_link ]
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
#  depends_on                         = "${google_compute_address.nat_ip}"
}
