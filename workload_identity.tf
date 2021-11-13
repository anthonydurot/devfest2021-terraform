
module "my-app-workload-identity" {
  source     = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  name       = var.gcp_sa_workload_id_secret_manager_accessor
  namespace  = "devfest-secret-manager"
  project_id = var.project_id
  roles      = ["roles/secretmanager.secretAccessor"]
  cluster_name = google_container_cluster.primary.name
}

module "my-app-workload-identity-iam-authent" {
  source     = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity" 
  name       = var.gcp_sa_workload_id_sql_user
  namespace  = "iam-db-authentification"
  project_id = var.project_id
  roles      = ["roles/owner"]
  cluster_name = google_container_cluster.primary.name
  depends_on = [
    module.my-app-workload-identity
  ]
}