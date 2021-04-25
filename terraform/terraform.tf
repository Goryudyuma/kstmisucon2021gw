terraform {
  backend "s3" {
    region  = "ap-northeast-1"
    bucket  = "kstmisucon2021gw-terraform"
    key     = "default.tfstate"
    encrypt = true
  }
}
