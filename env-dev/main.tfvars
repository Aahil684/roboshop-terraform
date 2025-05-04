db_instances = {

  mongodb = {
    ami_id           = "ami-09c813fb71547fc4f"
    instance_type    = "t3.small"
    root_volume_size = 20
  }
  redis = {
    ami_id           = "ami-09c813fb71547fc4f"
    instance_type    = "t3.small"
    root_volume_size = 20
  }

  mysql = {
    ami_id           = "ami-09c813fb71547fc4f"
    instance_type    = "t3.small"
    root_volume_size = 20
  }
  rabbitmq = {
    ami_id           = "ami-09c813fb71547fc4f"
    instance_type    = "t3.small"
    root_volume_size = 20
  }

}

zone_id = "Z01537493BA6YJ34JEG5T"
vpc_security_group_ids  = ["sg-011b80b1cf6734e37"]
env = "dev"

eks = {
  main = {
    eks_version = 1.32
    subnets = ["subnet-0b0ba211ddd146877", "subnet-06d323ded2cdfe0bf"]
    node_groups = {
      main = {
        instance_types = ["t3.medium", "t3.small"]
        min_nodes = 4
        max_nodes = 10
      }
    }
    addons = {
      #metrics-server = {}
      pod-identity-agent = {}
    }

    access = {
        workstation = {
            role                   = "arn:aws:iam::183295444327:role/workstation"
            kubernetes_groups      = []
            policy_arn             = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
            access_scope_type     = "cluster"
            access_scope_namespaces = []

        }
    }

  }
}