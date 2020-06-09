resource "aws_s3_bucket" "jpbucket" {
  bucket = "jpbucket-mcai5jp2"
  acl    = "private"

  tags = {
    Name = "jpbucket-mcai5jp2"
  }
}

