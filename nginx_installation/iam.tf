resource "aws_iam_role" "developer-role" {
  name               = "developer-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_instance_profile" "developer-role-instanceprofile" {
  name = "developer-role"
  role = aws_iam_role.developer-role.name
}

resource "aws_iam_role_policy" "developer-role-policy" {
  name = "developer-role-policy"
  role = aws_iam_role.developer-role.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": [
              "s3:*"
            ],
            "Resource": [
              "arn:aws:s3:::jpbucket-mcai5jp2",
              "arn:aws:s3:::jpbucket-mcai5jp2/*"
            ]
        }
    ]
}
EOF

}

