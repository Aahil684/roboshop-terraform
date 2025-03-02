resource "aws_instance" "instance" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = var.name
  }
}

resource "aws_route53_record" "record" {
  zone_id = var.zone_id
  name = "${var.name}-${var.env}"
  type = "A"
  ttl = 10
  records = [aws_instance.instance.private_ip]
}
resource "null_resource" "example" {
  depends_on = [aws_route53_record.record]
  provisioner "local-exec" {

    connection {
      type        = "ssh"
      user        = ec2-user
      private_key = DevOps321
      host        = aws_instance.instance.private_ip
    }
    inline = [
      "sudo pip3.11 install ansible",
      "ansible-pull -i localhost, -U https://github.com/Uzma-Solera/Ansible-repo.git roles.roboshop.yml -e component_name=${var.name}" -e env=${var.dev}",
    ]

  }
}
