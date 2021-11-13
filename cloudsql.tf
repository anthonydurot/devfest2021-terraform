resource "google_sql_database" "database" {
  name     = "devfest_database"
  instance = google_sql_database_instance.instance.name
  depends_on = [
    google_sql_database_instance.instance
  ]
}
resource "google_sql_database" "cicd" {
  name     = "devfest_database_cicd"
  instance = google_sql_database_instance.instance.name
  depends_on = [
    google_sql_database_instance.instance
  ]
}

resource "google_sql_database" "secret_manager" {
  name     = "devfest_database_secret_manager"
  instance = google_sql_database_instance.instance.name
  depends_on = [
    google_sql_database_instance.instance
  ]
}

resource "google_sql_database" "vault" {
  name     = "devfest_database_vault"
  instance = google_sql_database_instance.instance.name
  depends_on = [
    google_sql_database_instance.instance
  ]
}

resource "google_sql_database" "iam" {
  name     = "devfest_database_iam"
  instance = google_sql_database_instance.instance.name
  depends_on = [
    google_sql_database_instance.instance
  ]
}

resource "google_sql_database_instance" "instance" {
  name   = "devfest-database-instance-new"
  region = "us-central1"

  database_version = "MYSQL_8_0"

  #depends_on = [google_service_networking_connection.private_vpc_connection]

  settings {
    disk_size = 10
    ip_configuration {
      ipv4_enabled    = false
      private_network = google_compute_network.vpc.self_link
    }
    tier = "db-f1-micro"
  }

  deletion_protection = "false"
}

resource "google_sql_user" "users" {
  name     = "root"
  instance = google_sql_database_instance.instance.name
  host     = "%"
  password = "password"
  depends_on = [
    google_sql_database_instance.instance
  ]
}


# IAM DB Authentifcation
resource "google_sql_user" "iam_user" {
  #name     = "sa-name@project-id.iam"
  #name = "${var.gcp_sa_workload_id_name}@${var.project_id}.iam"
  name = module.my-app-workload-identity-iam-authent.gcp_service_account_email
  instance = google_sql_database_instance.instance.name
  type     = "CLOUD_IAM_SERVICE_ACCOUNT"
  depends_on = [
    google_sql_database_instance.instance
  ]
}
