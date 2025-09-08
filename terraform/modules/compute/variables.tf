variable "tags" {
  description = "Tags to apply to the compute resources"
  type        = map(string)
  default     = {}
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "environment" {
  description = "Environment for the compute resources (e.g., dev, staging, prod)"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "Key pair name for SSH access"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID for the EC2 instance"
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the EC2 instance"
  type        = list(string)
}

variable "user_data" {
  description = "User data script to run on instance launch"
  type        = string
}

variable "root_volume_size" {
    description = "Size of the root volume in GB"
    type        = number
    default     = 30
}

variable "root_volume_type" {
    description = "Type of the root volume (e.g., gp2, io1)"
    type        = string
    default     = "gp3"
}

variable "root_volume_delete_on_termination" {
    description = "Whether to delete the root volume on instance termination"
    type        = bool
    default     = true
}

variable "root_volume_encrypted" {
    description = "Whether the root volume should be encrypted"
    type        = bool
    default     = true
}