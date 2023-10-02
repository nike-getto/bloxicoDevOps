module "elastic_ips" {
  source = "./modules/elastic_ip"

  instance_ids = module.web_instances.instance_ids
}
