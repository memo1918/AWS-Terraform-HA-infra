resource "aws_launch_template" "ec2Docker" {
    name = "ec2Docker"
    image_id = var.ec2_ami
    instance_type = var.ec2_type
    ebs_optimized = true
    vpc_security_group_ids = [aws_security_group.prod_secGroup.id]

    iam_instance_profile {
        name = aws_iam_instance_profile.ssm_instance_profile.name
    }

    block_device_mappings {
        device_name = "/dev/sda1"
        ebs {
            volume_size = 8
            volume_type = "gp3"
            delete_on_termination = true
        }
    }
    lifecycle {
        create_before_destroy = true
    }

    key_name = aws_key_pair.tf_ec2_key.key_name # Attach the key pair

    user_data = var.ec2_user_data


    tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "myasg"
    }
  }
}

resource "tls_private_key" "tf_ec2_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create local file
resource "local_file" "tf_ec2_key" {
  content  = tls_private_key.tf_ec2_key.private_key_pem
  filename = "${path.module}/../tf_ec2_key.pem"
}

# Create AWS key pair
resource "aws_key_pair" "tf_ec2_key" {
  key_name   = "tf_ec2_key"
  public_key = tls_private_key.tf_ec2_key.public_key_openssh
}