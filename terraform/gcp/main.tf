terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file("chave.json")

  project = "reflecting-site-366322"
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_instance" "AmoPromoDevOpsTeste" {
  name         = "amopromodevops"
  machine_type = "e2-micro"
  zone         = "us-central1-c"


  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }
}