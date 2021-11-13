variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

variable gcp_sa_workload_id_secret_manager_accessor {
  description = "Nom du Service Account GCP accessible via Workload Identity pour accéder à Secrets Manager"

}
variable gcp_sa_workload_id_sql_user {
  description = "Nom du Service Account GCP accessible via Workload Identity pour se connecter à Cloud SQL"
}