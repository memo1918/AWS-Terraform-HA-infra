
resource "aws_lb" "loadBalancer" {
    name = "myLB"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.load_balancer_secGroup.id]
    subnets = [aws_subnet.public_subnet.id, aws_subnet.public_subnet2.id]
  
}

resource "aws_lb_target_group" "ec2DockerG" {
  name = "ec2DockerG"
  port = 80
  protocol = "HTTP"
  vpc_id = aws_vpc.prod_vpc.id
  target_type = "instance"
  health_check {
    path = "/"
    protocol = "HTTP"
    port = 80
  }
}

resource "aws_lb_listener" "lbListener" {
    load_balancer_arn = aws_lb.loadBalancer.arn
    port = "80"
    protocol = "HTTP"
    default_action {
        type = "forward"
        target_group_arn = aws_lb_target_group.ec2DockerG.arn
    }
}

