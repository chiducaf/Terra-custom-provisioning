#create storage bucket

resource "google_storage_bucket" "terra-gcs" {
force_destroy = true
location      = "${var.region}"
name          = "${var.bucket-name}"
storage_class = "${var.storage-class}"
versioning {
  enabled = true
  }
}
