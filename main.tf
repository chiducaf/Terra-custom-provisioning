resource "random_id" "instance_id" {
byte_length = 8
}

resource "google_compute_instance" "terraform" {
#count          = "2"
#name           = "terraform-vm-${count.index+1}"
name           = "terra-vm-${random_id.instance_id.hex}"
machine_type   = "${var.vm_type}"
can_ip_forward = false
zone           = "${var.zone}"
tags           = ["ssh","http","https"]

boot_disk {
initialize_params {
image = "${google_compute_image.bootable-image.self_link}"
}
}

metadata_startup_script = "sudo apt-get -y update;sudo apk update; sudo apt-get -y dist-upgrade; sudo apt-get -y install nginx"
#sudo apt-get -y install git; sudo apt-get -y install openjdk-8-jdk; sudo apt-get -y install maven; sudo wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | sudo apt-key add - ; sudo echo deb http://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list; sudo apt-get -y update; sudo apt-get -y install jenkins; sudo service jenkins start

scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

network_interface {
network    = "${google_compute_network.vpc.name}"
subnetwork = "${google_compute_subnetwork.subnet.name}"
#access_config {
#}
}

#metadata {
#sshKeys = "gcp_public:${file("gcp_public.pub")}"
#sshKeys = "ubuntu_gcp:${file("ubuntu_gcp.pub")}"
#}
}

