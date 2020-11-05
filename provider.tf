
provider "google" {
credentials = "${file("terraform-gcp1.json")}"
project     = "${var.project-name}"
region      = "${var.region}"
}
provider "google-beta" {
credentials = "${file("terraform-gcp1.json")}"
project     = "${var.project-name}"
region      = "${var.region}"
}
