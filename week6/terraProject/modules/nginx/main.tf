module "nginx_instance" {
  source = "./modules/nginx"

  count = 2

  instance_name = "nginx-instance-${count.index + 1}"
}
