#ec2 variable

variable "instance_names" {
    type = list
    defualt = ["db","backend","frontend"]
}

variable "image_id" {
    type = string
    default = "ami-041e2ea9402c46c32"
    description = "RHEL-9 AMI ID"
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "common_tags" {
    default = {
        Project = "Expense"
        Environment = "Dev"
        terraform = "true"
    }
}

#security_group variable
variable "sg_name" {
    default = "allow_ssh"
}

variable "sg_description" {
    default = "allowing port 22"
}

variable "ssh_port" {
    default = 22
}

variable "protocol" {
    default = "tcp"
}

variable "allowed_cidr" {
    type = list(string) #optional
    default = ["0.0.0.0/0"]
}

#R53 variables

variable "zone_id" {
    defualt = " " #copy from AWS R53
}

variable "domain_name" {
    default = "daws78s.online" #copy from AWS
}