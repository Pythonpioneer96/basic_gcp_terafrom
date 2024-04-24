terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "5.25.0"
    }
  }
}

provider "google" {
  # Configuration options

  project = "tier-microservice"
  region = "us-central1"
  zone = "us-central-1-a"
  credentials = "tier-microservice-5747caa38098.json"
  
}

resource "google_storage_bucket" "my-bucket-1" {
  name          = "my_super_unique_bucket_name_12345"
  location      = "US"
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 3
    }
    action {
      type = "Delete"
    }
  }

  lifecycle_rule {
    condition {
      age = 1
    }
    action {
      type = "AbortIncompleteMultipartUpload"
    }
  }
}