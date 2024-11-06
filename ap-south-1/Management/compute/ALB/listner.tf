resource "aws_lb_target_group" "management-bp-api-tg-pub-alb" {
  name        = "management-bp-api-tg-pub-alb"
  port        = 9001
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id
  health_check {
    protocol            = "HTTP"
    healthy_threshold   = 5
    path                = "/api/v1/default/health/"
    interval            = 30
    timeout             = 5
    unhealthy_threshold = 2
    enabled             = true
  }
}

resource "aws_lb_target_group" "management-bp-ui-tg-pub-alb" {
  name        = "management-bp-ui-tg-pub-alb"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id
  health_check {
    protocol            = "HTTP"
    healthy_threshold   = 5
    path                = "/"
    interval            = 30
    timeout             = 5
    unhealthy_threshold = 2
    enabled             = true
  }
}

resource "aws_lb_target_group" "management-bp-i-api-tg-pub-alb" {
  name        = "management-bp-i-api-tg-pub-alb"
  port        = 9004
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id
  health_check {
    protocol            = "HTTP"
    healthy_threshold   = 5
    path                = "/api/v1/default/health/"
    interval            = 30
    timeout             = 5
    unhealthy_threshold = 2
    enabled             = true
  }
}

resource "aws_lb_target_group" "management-bp-i-ui-tg-pub-alb" {
  name        = "management-bp-i-ui-tg-pub-alb"
  port        = 85
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = data.terraform_remote_state.network.outputs.vpc_id
  health_check {
    protocol            = "HTTP"
    healthy_threshold   = 5
    path                = "/"
    interval            = 30
    timeout             = 5
    unhealthy_threshold = 2
    enabled             = true
  }
}

resource "aws_lb_listener_rule" "static" {
  listener_arn = module.public_alb.alb_https_listener_arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.management-bp-api-tg-pub-alb.arn
  }

  condition {
    host_header {
      values = ["build-api.nimbuspost.domain"]
    }
  }
}

resource "aws_alb_listener_rule" "static2" {
  listener_arn = module.public_alb.alb_https_listener_arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.management-bp-ui-tg-pub-alb.arn
  }

  condition {
    host_header {
      values = ["build.nimbuspost.domain"]
    }
  }
}

resource "aws_alb_listener_rule" "static3" {
  listener_arn = module.public_alb.alb_https_listener_arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.management-bp-i-api-tg-pub-alb.arn
  }

  condition {
    host_header {
      values = ["build-insights-api.nimbuspost.domain"]
    }
  }
}

resource "aws_alb_listener_rule" "static4" {
  listener_arn = module.public_alb.alb_https_listener_arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.management-bp-i-ui-tg-pub-alb.arn
  }

  condition {
    host_header {
      values = ["build-insights.nimbuspost.domain"]
    }
  }
}

