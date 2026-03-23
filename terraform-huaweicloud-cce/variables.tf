variable "cluster_name" {
  description = "华为云CCE 集群名称"
  type        = string
  default     = "zwchen-k8s-cluster"
}

variable "cluster_flavor" {
  description = "集群规格"
  type        = string
  default     = "cce.s1.small"
}

variable "cluster_version" {
  description = "Kubernetes 版本"
  type        = string
  default     = "v1.34"
}

variable "node_count" {
  description = "节点数量"
  type        = number
  default     = 50
}

variable "node_flavor" {
  description = "节点规格"
  type        = string
  default     = "ac9.8xlarge.2"
}
variable "vpc_cidr" {
  description = "VPC"
  type        = string
  default     = "172.16.0.0/16"
}

variable "subnet_cidr" {
  description = "子网"
  type        = string
  default     = "172.16.0.0/18"
}
