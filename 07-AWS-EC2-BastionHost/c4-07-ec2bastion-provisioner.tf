# Null resource
resource "null_resource" "copy_ec2_keys" {
    depends_on = [ module.ec2_public ]
    connection {
      type = "ssh"
      host = aws_eip.bastion_eip.public_ip
      user = "ec2-user"
      password = ""
      private_key = file("../terraform-key.pem")
    }
    #File provisioner
    provisioner "file" {
      source = "../terraform-key.pem"
      destination = "/tmp/terraform-key.pem"
    }
    #Remote-exec provisioner
    provisioner "remote-exec" {
      inline = [ "sudo chmod 400 /tmp/terraform-key.pem" ]
    }
    #Local Provisioner
    provisioner "local-exec" {
      command = "echo VPC create on `date` and VPC ID: ${ module.vpc.vgw_id } > creation-time-vpc-id.txt"
      working_dir = "local-exec-output-files"
    }
}