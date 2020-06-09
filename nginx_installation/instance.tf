resource "aws_instance" "nginx_provision" {
  ami                  = var.AMIS[var.AWS_REGION]
  instance_type        = "t2.micro"
  key_name             = aws_key_pair.access_key.key_name
  iam_instance_profile = aws_iam_instance_profile.developer-role-instanceprofile.name

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo sed -i -e 's/\r$//' /tmp/script.sh",
      "sudo /tmp/script.sh",
    ]
  }
  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}

resource "aws_ebs_volume" "ebs-volume-1" {
  availability_zone = aws_instance.nginx_provision.availability_zone
  size              = 20
  type              = "gp2"
  tags = {
    Name = "extra volume data"
  }
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs-volume-1.id
  instance_id = aws_instance.nginx_provision.id
}

output "ip" {
  value = aws_instance.nginx_provision.public_ip
}
