output "client_token" {
  value = "${data.external.app_role.result.token}"
}
