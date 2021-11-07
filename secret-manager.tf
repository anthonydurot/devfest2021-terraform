resource "google_secret_manager_secret" "database-url" {
  secret_id = "database-url"

  replication {
    user_managed {
      replicas {
        location = "us-central1"
      }

    }
  }
}


resource "google_secret_manager_secret_version" "database-url" {
  secret = google_secret_manager_secret.database-url.id

  secret_data = "jdbc:mysql://${google_sql_database_instance.instance.private_ip_address}/${google_sql_database.secret_manager.name}"
}

resource "google_secret_manager_secret" "database-username" {
  secret_id = "database-username"

  replication {
    user_managed {
      replicas {
        location = "us-central1"
      }

    }
  }
}


resource "google_secret_manager_secret_version" "database-username" {
  secret = google_secret_manager_secret.database-username.id

  secret_data = google_sql_user.users.name
}


resource "google_secret_manager_secret" "database-password" {
  secret_id = "database-password"

  replication {
    user_managed {
      replicas {
        location = "us-central1"
      }

    }
  }
}


resource "google_secret_manager_secret_version" "database-password" {
  secret = google_secret_manager_secret.database-password.id

  secret_data = google_sql_user.users.password
}

