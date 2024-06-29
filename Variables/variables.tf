#Preferences
#1. command line
#2. tfvars
#3. environment variables (TF_VAR_<var-name>=value)
    #eg. export TF_VAR_instance_type=t3.large
#4. Default value

variable "image_id" {
    type = string #optional
    default = "ami-041e2ea9402c46c32" #optional
    description = "RHEL-9 AMI ID" #optional
}

variable "instance_type" {
    defualt = "t3.micro"
    type = string
}

variable "tags" {
    default = {
        Project = "Expense"
        Environment = "Dev"
        Module = "DB"
        Name = "DB"
    }
}

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