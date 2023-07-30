resource "aws_lb_target_group" "tg" {
  name       = "my-tg"
  port       = var.jenkins_port
  protocol   = "HTTP"
  vpc_id     = aws_vpc.jenkins.id
  slow_start = 0

  load_balancing_algorithm_type = "round_robin"

  stickiness {
    enabled = false
    type    = "lb_cookie"
  }
  depends_on = [aws_instance.jenkins]
  health_check {
    enabled             = true
    port                = var.jenkins_port
    interval            = 30
    protocol            = "HTTP"
    path                = "/login"
    matcher             = "200"
    healthy_threshold   = 9
    unhealthy_threshold = 9
  }

}