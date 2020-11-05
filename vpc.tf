#create VPC

resource "google_compute_network" "vpc" {
name                    = "${var.name}-vpc"
auto_create_subnetworks = "false"
routing_mode            = "GLOBAL"
}
#create Subnet

#resource "google_compute_subnetwork" "subnet" {
#name          = "${var.name}-subnet"
#ip_cidr_range = "${var.subnet_cidr}"
#network       = "${var.name}-vpc"
#depends_on    = ["google_compute_network.vpc"]
#region        = "${var.region}"
#}
#create firewall

#resource "google_compute_firewall" "firewall" {
#name    = "terraform"
#network = "${google_compute_network.vpc.name}"

#allow {
#protocol = "tcp"
#ports    = ["80","443","8080","22"]
#}

#allow {
#protocol = "icmp"
#}
# source_ranges = ["0.0.0.0/0"]
#}

#output "ip" {
#value = "${google_compute_instance.terraform.*.network_interface.0.access_config.0.nat_ip}"
#}

