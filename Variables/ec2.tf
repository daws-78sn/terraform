# resource <resource-type> <resource-name>
resource "aws_security_group" "allow_ssh" {
    name = var.sg_name
    description = var.sg_description
    
    # this is block
    ingress {
        from_port = var.ssh_port
        to_port = var.ssh_port
        protocol = var.protocol
        cidr_blocks = var.allowed_cidr
    }

    egress {
        from_port = 0 # from 0 to 0 means, opening all protocols
        to_port = 0 
        protocol = "-1" # -1 all protocals
        cidr_blocks = var.allowed_cidr
    }
    
    tags = var.tags
}

resource "aws_instance" "db" {
    ami = var.image.id
    instance_type = var.instance_type
    # left side things are called arguments, right side things are values
    vpc_security_group_ids = [aws_security_group.allow_ssh.id] #ssh.id it will create one id for it to use later or earlier if we write this code first or last or middle
    
    tags = {
        name = "db"
    }
}