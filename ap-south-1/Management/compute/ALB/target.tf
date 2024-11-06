resource "aws_lb_target_group_attachment" "bp-api" {
  target_group_arn = aws_lb_target_group.management-bp-api-tg-pub-alb.arn
  target_id        = data.terraform_remote_state.buildpiper.outputs.instance_id[0][0]
  port             = 9001
}


resource "aws_lb_target_group_attachment" "bp-ui" {
  target_group_arn = aws_lb_target_group.management-bp-ui-tg-pub-alb.arn
  target_id        = data.terraform_remote_state.buildpiper.outputs.instance_id[0][0]
  port             = 80
}

resource "aws_lb_target_group_attachment" "bp-insights-api" {
  target_group_arn = aws_lb_target_group.management-bp-i-api-tg-pub-alb.arn
  target_id        = data.terraform_remote_state.buildpiper.outputs.instance_id[0][0]
  port             = 9004
}

resource "aws_lb_target_group_attachment" "bp-insights-ui" {
  target_group_arn = aws_lb_target_group.management-bp-i-ui-tg-pub-alb.arn
  target_id        = data.terraform_remote_state.buildpiper.outputs.instance_id[0][0]
  port             = 85
}



