# Null resource
resource "null_resource" "copy_ec2_keys" {
    depends_on = [ module.ec2_public ]
    connection {
      type = "ssh"
      host = aws_eip.bastion_eip.public_ip
      user = "ec2-user"
      password = ""
      private_key = file("terraform-key.pem")
    }
    #File provisioner
    provisioner "file" {
      source = "terraform-key.pem"
      destination = "/tmp/terraform-key.pem"
      on_failure = continue
    }
    #Remote-exec provisioner
    provisioner "remote-exec" {
      inline = [ "chmod 400 /tmp/terraform-key.pem" ]
      on_failure = continue
    }
  
    #Local Provisioner
    provisioner "local-exec" {
      command = "echo VPC create on `date` and VPC ID: ${ module.vpc.vpc_id } >> creation-time-vpc-id.txt"
      working_dir = "local-exec-output-files"
      on_failure = continue
  
    }
}