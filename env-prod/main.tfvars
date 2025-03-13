instances = {
  frontend = {
    ami_id        = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    ansible_role = "frontend-docker"
  }
  catalogue = {
    ami_id        = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    ansible_role = "catalogue-docker"
  }
  mongodb = {
    ami_id        = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"

  }
  redis = {
    ami_id        = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
  }
  cart = {
    ami_id        = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    ansible_role = "cart-docker"

  }
  user = {
    ami_id        = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
  }
  shipping = {
    ami_id = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    ansible_role = "shipping-docker"

  }

}
zone_id = "Z01537493BA6YJ34JEG5T"
vpc_security_group_ids  = ["sg-011b80b1cf6734e37"]
env = "prod"