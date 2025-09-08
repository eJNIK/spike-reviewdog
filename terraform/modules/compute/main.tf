resource "aws_instance" "main" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = var.security_group_ids
  associate_public_ip_address = true
  user_data                   = var.user_data

  root_block_device {
    volume_size           = var.root_volume_size
    volume_type           = var.root_volume_type
    delete_on_termination = var.root_volume_delete_on_termination
    encrypted             = var.root_volume_encrypted

    tags =  merge(
      {
        Name      = "${local.name}-ebs"
        ManagedBy = "Terraform"
      },
      var.tags
    )
  }

  tags = merge(
    {
      Name      = "${local.name}-instance"
      ManagedBy = "Terraform"
    },
    var.tags
  )
}

resource "aws_eip" "main" {
  instance = aws_instance.main.id
  domain   = "vpc"

  tags = merge(
    {
      Name      = "${local.name}-eip"
      ManagedBy = "Terraform"
    },
    var.tags
  )
}
