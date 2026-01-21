resource "google_service_account" "n8n_sa" {
  account_id   = "n8n-service-account"
  display_name = "N8N Service Account"
}
