#module "appRole" {
#  source            = "./modules/app_role"
#  approle_role_id   = "${var.approle_role_id}"
#  approle_secret_id = "${var.approle_secret_id}"
#  vault_addr        = "${var.vault_addr}"
#}

module "instance" {
  source           = "./modules/instance"
  aws_account_name = "${var.aws_account_name}"
  service_name     = "${var.service_name}"
  vault_addr       = "${var.vault_addr}"
  vault_token      = "${var.vault_token}"
}
