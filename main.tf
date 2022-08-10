##
## EKS cluster creation [using default vpc]
##

module "eks" {
  source  = "./modules/eks"
  subnet1 = var.subnet1
  subnet2 = var.subnet2
}
