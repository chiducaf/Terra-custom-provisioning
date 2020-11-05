variable "region" {
  default = "us-central1"
}
variable "name"{
  default= "terraform"
}
variable "subnet_cidr"{
  default = "10.10.0.0/24"
}
variable "fw_name" {
  default = "terraform-fw"
}
variable "project-name" {
  default = "devsecops-287407"
}
#variable "tags"{
#type = "list"
  #default = ["Terraform-1", "Terraform-2"]
#}
variable "zone" {
  default = "us-central1-c"
}
#variable "image" {
#  default = "ubuntu-os-cloud/ubuntu-1604-lts"
#}
variable "vm_type" {
  default = "f1-micro"
}
variable "bucket-name" {
  default     = "terraform-gcs"
  type        = string
  description = "The name of the Google Storage Bucket to create"
}
variable "storage-class" {
  default     = "REGIONAL"
  type        = string
  description = "The storage class of the Storage Bucket to create"
}
variable "role_id" {
  default     = "terra_iam_88"
  type        = string
  description = "ID of the Custom Role."
}
variable "title" {
  type        = string
  description = "Human-readable title of the Custom Role, defaults to role_id."
  default     = ""
}
variable "target_level" {
  type        = string
  description = "String variable to denote if custom role being created is at project or organization level."
  default     = "project"
}
variable "target_id" {
  default     = "devsecops-287407"
  type        = string
  description = "Variable for project or organization ID."
}

#variable "instance_type"{
 # type = string
 # }
#variable "vm_names"{
 # type = list(string)
  #default = ["jenkins-vm1","jenkins-vm2","jenkins-vm2"]
 # }

