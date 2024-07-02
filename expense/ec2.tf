resource "aws_instance" "expense" {
    count = length(var.instance_names)
    ami = var.image.id
    instance_type = var.instance_names[count.index] == "db" ? "t3.small" : "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_ssh.id] #ssh.id it will create one id for it to use later or earlier if we write this code first or last or middle
    tags = merge(
        var.common_tags, #map
        { 
            Name = var.instance_names[count.index] 
            Module = var.instance_names[count.index]
        }
    )
}

resource "aws_security_group" "allow_ssh" {
    name = var.sg_name
    description = var.sg_description

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