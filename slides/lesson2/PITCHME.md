# Lesson 02 - Scale Your App

---

## Define A Launch Configuration

```
resource "aws_launch_configuration" "lc" {
  lifecycle {
    create_before_destroy = true
  }

  name_prefix                 = "${var.metadata["appname"]}-${var.env}-lc-${var.metadata["appversion"]}-"
  image_id                    = "${data.aws_ami.amazon_linux.id}"
  instance_type               = "${var.instance_type}"
  security_groups             = ["${aws_security_group.web.id}"]
  user_data                   = "${data.template_file.deploy_sh.rendered}"
  key_name                    = "${var.key_name}"
  associate_public_ip_address = "${var.associate_public_ip_address}"
}
```

![](assets/img/background.png)

---
@title[Customize Slide Layout]

@snap[west span-50]
## Create An AutoScaling Group
@snapend

@snap[east span-50]
```resource "aws_autoscaling_group" "asg" {
  name_prefix               = "${var.metadata["appname"]}-${var.env}-asg-${var.metadata["appversion"]}-"
  launch_configuration      = "${aws_launch_configuration.lc.name}"
  availability_zones        = ["${data.aws_availability_zones.available.zone_ids}"]
  load_balancers            = ["${aws_elb.elb.id}"]
  health_check_type         = "${var.health_check_type}"
  health_check_grace_period = "${var.health_check_grace_period}"
  default_cooldown          = "${var.default_cooldown}"
  min_size                  = "${var.min_size}"
  max_size                  = "${var.max_size}"
  wait_for_elb_capacity     = "${var.min_size}"
  desired_capacity          = "${var.desired_capacity}"
  vpc_zone_identifier       = ["${data.aws_subnet_ids.vpc_subnets.ids}"]

  tags = "${list(
    map("key", "Name",          "value", "${var.metadata["appname"]}-${var.env}-ec2-${var.metadata["appversion"]}",         "propagate_at_launch", true)
  )}"

  lifecycle {
    create_before_destroy = true
  }
}```
@snapend

---?color=#E58537
@title[Add A Little Imagination]

@snap[north-west]
#### Add a splash of @color[cyan](**color**) and you are ready to start presenting...
@snapend

@snap[west span-55]
@ul[spaced text-white]
- You will be amazed
- What you can achieve
- *With a little imagination...*
- And **GitPitch Markdown**
@ulend
@snapend

@snap[east span-45]
@img[shadow](assets/img/background.png)
@snapend

---?image=slides/assets/img/background.png

@snap[north span-100 headline]
## Now It's Your Turn Ch
@snapend

@snap[south span-100 text-06]
[Click here to jump straight into the interactive feature guides in the GitPitch Docs @fa[external-link]](https://gitpitch.com/docs/getting-started/tutorial/)
@snapend