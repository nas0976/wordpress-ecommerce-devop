terraform {
  required_version = ">= 1.0.0"
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "~> 2.4.0"
    }
  }
}

provider "local" {}

# Exemple de ressource IaC locale pour initialiser un fichier de configuration ou un inventaire
resource "local_file" "ansible_inventory_placeholder" {
  content  = "# Inventaire Ansible généré par Terraform\n[wordpress_servers]\nlocalhost ansible_connection=local\n"
  filename = "${path.module}/../ansible/inventory.ini"
}

output "terraform_status" {
  value = "Configuration Terraform initialisée avec succès pour le projet e-commerce !"
}
