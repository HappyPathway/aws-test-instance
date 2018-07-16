data "external" "app_role" {
  program = ["bash", "${path.module}/app_role.sh"]

  query = {
    role_id   = "${var.approle_role_id}"
    secret_id = "${var.approle_secret_id}"
    address   = "${var.vault_addr}"
  }
}
