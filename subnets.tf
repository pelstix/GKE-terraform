# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork
resource "google_compute_subnetwork" "private" {
  name                     = "pelstix-private-subnet"
  ip_cidr_range            = "192.168.0.0/20"
  region                   = "us-west1"
  network                  = google_compute_network.main.id
  private_ip_google_access = true

  secondary_ip_range {
    range_name    = "pelstix-k8s-pod-range"
    ip_cidr_range = "192.168.16.0/21"
  }
  secondary_ip_range {
    range_name    = "pelstix-k8s-service-range"
    ip_cidr_range = "192.168.32.0/24"
  }
}
