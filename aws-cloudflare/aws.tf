resource "aws_instance" "server" {
  ami = "ami-0df7a207adb9748c7" # Ubuntu 22.04 LTS

  instance_type = "t2.micro"
  tags = {
    Name = "terraform-deploy"
  }
}
