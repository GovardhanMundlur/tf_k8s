resource "kubernetes_namespace" "cert" {
  metadata {
    name = "cert-manager"
  }
}

resource "helm_release" "cert_manager" {
  name  = "cert-manager"
  chart = "cert-manager"
  repository = "https://charts.jetstack.io"
  namespace = kubernetes_namespace.cert.metadata.0.name
  depends_on = [ kubernetes_namespace.cert ]
  set {
    name  = "installCRDs"
    value = "true"
  }
}