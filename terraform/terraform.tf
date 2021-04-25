terraform {
  backend "s3" {
    bucket  = "kstmisucon2021gw-terraform"
    encrypt = true
  }
}
