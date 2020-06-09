resource "aws_key_pair" "access_key" {
  key_name   = "access_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}