resource "aws_instance" "web_instance" {
  count = var.count

  ami           = "ami-0e44cb2ad87b3a924"
  instance_type = "t2.micro"

  user_data = <<-EOF
             #!/bin/bash
             sudo apt-get update -y
             sudo apt-get upgrade -y
             sudo apt-get install nginx -y
             if [[ "$(curl -s http://169.254.169.254/latest/meta-data/instance-id)" == "i-1" ]]; then
               echo "<html><body style='background-color: blue;'><h1>Blue Background</h1></body></html>" | sudo tee /var/www/html/index.html
             else
               echo "<html><body style='background-color: green;'><h1>Green Background</h1></body></html>" | sudo tee /var/www/html/index.html
             fi
             sudo systemctl enable nginx
             sudo systemctl start nginx
             EOF
}

resource "aws_network_interface_attachment" "ni1" {
  count                = var.count
  network_interface_id = aws_instance.web_instance[count.index].network_interface_ids[0]
}

resource "aws_network_interface_attachment" "ni2" {
  count                = length(var.instance_ids)
  network_interface_id = aws_instance.web_instance[count.index].network_interface_ids[0]
}

resource "aws_network_interface_sg_attachment" "sg1" {
  security_group_id    = module.security_group.web_sg_id
  network_interface_id = aws_instance.web_instance[0].network_interface_ids[0]
}

resource "aws_network_interface_sg_attachment" "sg2" {
  security_group_id    = module.security_group.web_sg_id
  network_interface_id = aws_instance.web_instance[1].network_interface_ids[0]
}
