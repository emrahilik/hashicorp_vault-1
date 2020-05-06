resource "aws_instance" "vault" {
  instance_type               = "${var.instance_type}"
  ami                         = "${var.ami}"
  key_name                    = "${var.key_name}"
  vpc_security_group_ids      = ["${aws_security_group.allow_ssh_and_vault.id}"]
  availability_zone           = "${var.region}${var.az1}"
  subnet_id                   = "${aws_subnet.public1.id}"
  associate_public_ip_address = "true"
  source_dest_check           = false

  provisioner "file" {
    source      = "vault.service"
    destination = "/tmp/vault.service"

    connection {
      host        = "${self.public_ip}"
      type        = "ssh"
      user        = "${var.user}"
      private_key = "${file("~/.ssh/id_rsa")}"
    }
  }

  provisioner "file" {
    source      = "vault.hcl"
    destination = "/tmp/vault.hcl"

    connection {
      host        = "${self.public_ip}"
      type        = "ssh"
      user        = "${var.user}"
      private_key = "${file("~/.ssh/id_rsa")}"
    }
  }

  provisioner "remote-exec" {
    connection {
      host        = "${self.public_ip}"
      type        = "ssh"
      user        = "${var.user}"
      private_key = "${file("~/.ssh/id_rsa")}"
    }

    inline = [
      "sudo yum install -y wget unzip -y",
      "wget -P /tmp/ https://releases.hashicorp.com/vault/1.1.2/vault_1.1.2_linux_amd64.zip",
      "unzip /tmp/vault_1.1.2_linux_amd64.zip",
      "sudo mv ~/vault  /bin/",
      "vault version",
      "sudo mkdir /etc/vault",
      "sudo mv /tmp/vault.service /etc/systemd/system/",
      "sudo mv /tmp/vault.hcl /etc/vault/",
      "sudo systemctl daemon-reload",
      "sudo systemctl enable --now vault",
      "sudo systemctl restart vault",
    ]
  }

  tags = {
    Name = "Vault"
  }
}
