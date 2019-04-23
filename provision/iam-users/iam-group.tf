resource "aws_iam_group" "default" {
  name = "${var.group_name}"
}

resource "aws_iam_group_policy_attachment" "ec2-full" {
  group      = "${aws_iam_group.default.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2FullAccess"
}

resource "aws_iam_group_policy_attachment" "route53-domains" {
  group      = "${aws_iam_group.default.name}"
  policy_arn = "arn:aws:iam::aws:policy/AmazonRoute53DomainsFullAccess"
}
