instances {
  frontend = {
    ami_id        = ami-09c813fb71547fc4f
    instance_type = "t2.micro"
  }
  catalogue {
    ami_id = ami-09c813fb71547fc4f
    instance_type = "t2.micro"
  }
   mongodb {
     ami_id = ami-09c813fb71547fc4f
     instance_type = "t2.micro"
   }

  redis {
    ami_id = ami-09c813fb71547fc4f
    instance_type = "t2.micro"
  }
  cart {
    ami_id = ami-09c813fb71547fc4f
    instance_type = "t2.micro"
  }

  User {
    ami_id = ami-09c813fb71547fc4f
    instance_type = "t2.micro"
  }
  shipping {
    ami_id = ami-09c813fb71547fc4f
    instance_type = "t2.micro"
  }
}

zone_id = "Z01537493BA6YJ34JEG5T"
vpc_security_group_ids  = ["sg-011b80b1cf6734e37"]
env = dev