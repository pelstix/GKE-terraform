# https://registry.terraform.io/providers/hashicorp/google/latest/docs
provider "google" {
  project = "fill-in-your-projectid-here"
  region  = "us-west1"
}

# https://www.terraform.io/language/settings/backends/gcs
terraform {
  backend "gcs" {
    bucket = "fill-in-the-bucket-created"
    prefix = "terraform/state"
  }
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }
}
