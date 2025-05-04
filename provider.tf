provider "aws" {
  region = "us-east-1"
}

provider "vault" {
  address = "http://vault-internal.uzma83.shop:8200"
  token   = var.vault_token
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }