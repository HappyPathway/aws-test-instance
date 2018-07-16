provider "aws" {
  access_key = "${data.vault_aws_access_credentials.creds.access_key}"
  secret_key = "${data.vault_aws_access_credentials.creds.secret_key}"
}

provider "vault" {
  token   = "${var.vault_token}"
  address = "${var.vault_addr}"
}

data "vault_aws_access_credentials" "creds" {
  backend = "aws-${var.aws_account_name}"
  role    = "ec2_admin"
}
