resource "huaweicloud_vpc" "zwchen-vpc" {
  name = "${var.cluster_name}-vpc"
  cidr = var.vpc_cidr
}

resource "huaweicloud_vpc_subnet" "zwchen-subnet" {
  name          = "${var.cluster_name}-subnet"
  cidr          = var.subnet_cidr
  gateway_ip    = cidrhost(var.subnet_cidr, 1)
  vpc_id        = huaweicloud_vpc.zwchen-vpc.id
}

resource "huaweicloud_cce_cluster" "zwchen-cce" {
  name                   = var.cluster_name
  cluster_type           = "VirtualMachine"
  flavor_id              = var.cluster_flavor
  vpc_id                 = huaweicloud_vpc.zwchen-vpc.id
  subnet_id              = huaweicloud_vpc_subnet.zwchen-subnet.id
  kube_proxy_mode        = "iptables"
  description            = "zwchen create a cce cluster"
  cluster_version        = var.cluster_version

}
resource "huaweicloud_cce_node" "zwchen-k8s-nodes" {
  count = var.node_count
  cluster_id        = huaweicloud_cce_cluster.zwchen-cce.id
  name              = "${var.cluster_name}-node-${count.index + 1}"
  flavor_id         = var.node_flavor

  root_volume {
    size       = 100
    volumetype = "SAS" 
  }

  data_volumes {
    size       = 500
    volumetype = "SAS"
  }
}
