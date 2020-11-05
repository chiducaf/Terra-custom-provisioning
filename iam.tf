locals {
  custom-role-output = (var.target_level == "project") 
#(google_project_iam_custom_role.project-custom-role[0].role_id)
}

resource "google_project_iam_custom_role" "project-custom-role" {
count = var.target_level == "project" ? 1 : 0
  role_id     = "${var.role_id}"
  project     = "${var.project-name}"
  title       = var.title == "" ? var.role_id : var.title
  description = "terraform custom iam role"
  permissions = [
    "iam.roles.list", "iam.roles.create", "iam.roles.delete",
    "cloudkms.cryptoKeyVersions.useToEncrypt"
  ]
}

