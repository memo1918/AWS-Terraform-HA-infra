variable "ec2_type" {
  description = "type of ec2 instance"
  type        = string
  default     = "t2.micro"

}
variable "ec2_ami" {
  description = "AMI for ec2 instance"
  type        = string
  default     = "ami-0ea3c35c5c3284d82"

}

variable "ec2_user_data" {
  description = "value for user data"
  type        = string
  default = base64encode(templatefile("${path.module}/../initSetup.tftpl", {
                          EFS_DNS_NAME = aws_efs_file_system.prod_efs.dns_name,
                          }))
}

variable "nat_ami" {
  description = "AMI for NAT instance"
  type        = string
  default     = "ami-0adfb4e8d8a3bdf82"
}

variable "nat_type" {
  description = "type of NAT instance"
  type        = string
  default     = "t2.micro"
  
}