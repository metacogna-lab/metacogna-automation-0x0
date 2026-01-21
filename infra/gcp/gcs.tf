resource "google_storage_bucket" "n8n_backups" {
  name          = "n8n-backups-bucket"
  location      = "US"
  force_destroy = false

  uniform_bucket_level_access = true
}
