variable "instance_type" {
	type = string
	default = "t2.micro"
}
resource "aws_instance" "web" {
  ami           = "ami-0607784b46cbe5816"
  instance_type = var.instance_type
  count = 2

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = aws_instance.web.availability_zone
  size              = 1


tags = {
    Name = "HelloWorld"
  }
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.web.id
}
