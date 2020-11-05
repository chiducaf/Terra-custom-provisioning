resource "google_compute_snapshot" "snapshot" {
  name        = "terraform-snap"
  source_disk = google_compute_disk.persistent.name
  zone        = "${var.zone}"
   labels = {
    my_label = "value"
  }
}
resource "google_compute_disk" "persistent" {
  name  = "debian-disk"
  image = "${google_compute_image.bootable-image.self_link}"
  size  = 10
  type  = "pd-ssd"
  zone  = "${var.zone}"
}
