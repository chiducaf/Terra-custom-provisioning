#output "terra-instance-1" {
#value = google_compute_instance.terraform[0].network_interface[0].access_config[0].nat_ip
#}
#output "terra-instance-2" {
#value = google_compute_instance.terraform[1].network_interface[0].access_config[0].nat_ip
#}

#output "ip" {
#value = "${google_compute_instance.terraform.*.network_interface.0.access_config.0.nat_ip}"
#}
output "nat_ip_address" {
  value = "${google_compute_address.nat_ip.address}"
}
output "load-balancer-ip-address" {
  value = "${google_compute_global_forwarding_rule.global_forwarding_rule.ip_address}"
}
