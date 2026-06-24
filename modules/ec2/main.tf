resource "aws_instance" "this" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.security_group_id]
  associate_public_ip_address = true

  user_data = templatefile("${path.module}/userdata.sh.tpl", {
    app_port = var.app_port
  })

  tags = {
    Name = var.name
  }
}