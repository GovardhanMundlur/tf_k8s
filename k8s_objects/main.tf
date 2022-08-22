module "istio" {
  source = "./modules/istio"
}

module "cert-manager" {
  source = "./modules/cert-manager"
}