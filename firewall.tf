# allow http traffic
resource "google_compute_firewall" "allow-http" {
  name = "${var.fw_name}-fw-allow-http"
  network = "${google_compute_network.vpc.name}"
  allow {
    protocol = "tcp"
    ports    = ["80","8080","8081","8888"]
  }
  target_tags = ["http"]
}
# allow https traffic
resource "google_compute_firewall" "allow-https" {
  name = "${var.fw_name}-fw-allow-https"
  network = "${google_compute_network.vpc.name}"
  allow {
    protocol = "tcp"
    ports    = ["443","8080"]
  }
  target_tags = ["https"]
}
# allow ssh traffic
resource "google_compute_firewall" "allow-ssh" {
  name = "${var.fw_name}-fw-allow-ssh"
  network = "${google_compute_network.vpc.name}"
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  target_tags = ["ssh"]
}
# allow internal icmp
resource "google_compute_firewall" "allow-internal" {
  name    = "fw-allow-internal"
  network = "${google_compute_network.vpc.name}"
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  source_ranges = [
    "${var.subnet_cidr}"
  ]
}
# allow custom portal
#resource "google_compute_firewall" "allow-custom" {
 # name = "${var.fw_name}-fw-allow-http"
 # network = "${google_compute_network.vpc.name}"
 # allow {
 #   protocol = "tcp"
 #   ports    = ["8080"]
 # }
 # target_tags = ["http","https"]
 # }
# allow rdp traffic
resource "google_compute_firewall" "allow-rdp" {
  name = "${var.fw_name}-fw-allow-rdp"
  network = "${google_compute_network.vpc.name}"
  allow {
    protocol = "tcp"
    ports    = ["3389"]
  }
  target_tags = ["rdp"]
}

#output "ip" {
#value = google_compute_instance.terraform[0].network_interface[0].access_config[0].nat_ip
#}
