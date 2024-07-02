resource "aws_instance" "db" {
    ami           = "ami-041e2ea9402c46c32"
    instance_type = "t3.micro"
    vpc_security_group_ids = ["sg-0909fab5362d64cd9"]

    tags = {
        Name = "db"
    }
  
}