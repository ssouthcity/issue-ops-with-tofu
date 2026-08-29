locals {
  account_vars               = read_terragrunt_config(find_in_parent_folders("account.hcl"))
  account_id                 = local.account_vars.locals.account_id
  state_bucket_name          = local.account_vars.locals.state_bucket_name
  state_bucket_access_key    = local.account_vars.locals.state_bucket_access_key
  state_bucket_access_secret = local.account_vars.locals.state_bucket_access_secret
}

generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOT
    terraform {
      backend "s3" {
        bucket = "${local.state_bucket_name}"
        key    = "${path_relative_to_include()}/tofu.tfstate"
        region                      = "auto"
        skip_credentials_validation = true
        skip_metadata_api_check     = true
        skip_region_validation      = true
        skip_requesting_account_id  = true
        skip_s3_checksum            = true
        use_path_style              = true
        access_key = "${local.state_bucket_access_key}"
        secret_key = "${local.state_bucket_access_secret}"
        endpoints = { s3 = "https://${local.account_id}.r2.cloudflarestorage.com" }
      }
    }
  EOT
}

generate "providers" {
  path      = "providers.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<-EOT
    provider "cloudflare" {}
  EOT
}

catalog {
  urls = [
    "github.com/ssouthcity/issue-ops-with-tofu"
  ]
}
