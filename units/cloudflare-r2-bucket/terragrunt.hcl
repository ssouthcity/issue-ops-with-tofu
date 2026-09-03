locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  account_id   = local.account_vars.locals.account_id
}

terraform {
  source = "${find_in_parent_folders("modules/cloudflare-r2-bucket")}"
}

include "root" {
  path = find_in_parent_folders("root.hcl")
}

inputs = {
  account_id = local.account_id
  name       = values.name
}
