resource "aws_efs_file_system" "prod_efs" {
    creation_token = "prod_efs"
    performance_mode = "generalPurpose"
    throughput_mode = "bursting"
    tags = {
        Name = "prod_efs"
    }
}


resource "aws_efs_mount_target" "prod_mountT1" {
    file_system_id = aws_efs_file_system.prod_efs.id
    subnet_id = aws_subnet.subnet1.id
    security_groups = [aws_security_group.efs_secGroup.id]
}


resource "aws_efs_mount_target" "prod_mountT2" {
    file_system_id = aws_efs_file_system.prod_efs.id
    subnet_id = aws_subnet.subnet2.id
    security_groups = [aws_security_group.efs_secGroup.id]
}