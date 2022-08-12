resource "kubernetes_namespace" "istio" {
  metadata {
    name = "istio-system"
  }
}

resource "helm_release" "istio_base" {
  name       = "istio-base"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "base"
  namespace  = kubernetes_namespace.istio.metadata.0.name
  depends_on = [ kubernetes_namespace.istio ]
}

resource "helm_release" "istiod" {
  name       = "istiod"
  repository = "https://istio-release.storage.googleapis.com/charts"
  chart      = "istiod"
  namespace  = kubernetes_namespace.istio.metadata.0.name
  depends_on = [kubernetes_namespace.istio, helm_release.istio_base]
  set {
    name  = "meshConfig.accessLogFile"
    value = "/dev/stdout"
  }
}