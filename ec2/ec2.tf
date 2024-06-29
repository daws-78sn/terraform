# resource <resource-type> <resource-name>
resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "allowing SSH access"

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        
    }

    egress {
        from_port = 0 # from 0 to 0 means, opening all protocols
        to_port = 0 
        protocol = "-1" # -1 all protocals
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "allow_ssh"
        CreatedBy = "Sivakumar"
    }
}

resource "aws_instance" "db" {
    ami = "ami-041e2ea9402c46c32"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id] #ssh.id it will create one id for it to use later or earlier if we write this code first or last or middle
    tags = {
        name = "db"
    }
}