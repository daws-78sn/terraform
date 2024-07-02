variable "instance_names" {
  type = map
  default = {
    db = "t3.small"
    backend = "t3.micro"
    frontend = "t3.micro"
  }
}

variable "common_tags" {
    type = map
    default = {
        project = "Expense"
        terraform - true
  
}

variable "domain_name" {
    default = "daws78s.online"  
}

variable "zone_id" {
    default = " " #copy from AWS R53Z3M3QZ7XQZ7S1"
  
}