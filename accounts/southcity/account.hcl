locals {
  account_id = "41ba25d1e160ac8eecac0518d16d2981"

  state_bucket_name          = "tgstate"
  state_bucket_access_key    = get_env("CLOUDFLARE_STATE_S3_ACCESS_KEY")
  state_bucket_access_secret = get_env("CLOUDFLARE_STATE_S3_ACCESS_SECRET")
}
