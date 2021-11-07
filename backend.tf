terraform {
  backend "gcs" {
    bucket  = "tf-state-devfest"
    prefix  = "terraform/state"
  }
}
