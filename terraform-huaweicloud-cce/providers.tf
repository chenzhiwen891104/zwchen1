terraform {
  required_version = ">= 1.0"

  required_providers {
    huaweicloud = {
      source  = "huaweicloud/huaweicloud"
      version = ">= 1.60.1"
    }
  }
}

provider "huaweicloud" {
  region     = "cn-north-1"           
  access_key = "******"
  secret_key = "******"
}
