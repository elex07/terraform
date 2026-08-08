terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.1.0"
    }
  }
}

provider "local" {}

data "local_file" "keyfile" {
  filename = "${path.module}/key.dat"
}

output "fingerprint" {
  value = base64encode(data.local_file.keyfile.content)
}
