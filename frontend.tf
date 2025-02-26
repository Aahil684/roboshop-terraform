resource "aws_instance" "frontend" {
  ami = "ami-09c813fb71547fc4f"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-011b80b1cf6734e37"]

  tags = {
    Name = "frontend"
  }
  provisioner "remote-exec" {


    connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = self.public_ip
    }

    inline = [
      "sudo pip3.11 install ansible",
      "ansible-pull -i localhost, -U https://github.com/Uzma-Solera/Ansible-repo.git roles.roboshop.yml -e component_name=frontend",
    ]










  }
}


