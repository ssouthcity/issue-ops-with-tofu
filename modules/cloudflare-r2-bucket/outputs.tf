output "id" {
  value       = cloudflare_r2_bucket.this.id
  description = "ID of the bucket."
}

output "account_id" {
  value       = cloudflare_r2_bucket.this.account_id
  description = "ID of the account the bucket is deployed in."
}

output "name" {
  value       = cloudflare_r2_bucket.this.name
  description = "Name of the bucket."
}

output "creation_date" {
  value       = cloudflare_r2_bucket.this.creation_date
  description = "Date of creation for the bucket."
}
