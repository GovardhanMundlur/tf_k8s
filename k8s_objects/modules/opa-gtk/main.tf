resource "kubernetes_namespace" "opa" {
  metadata {
    name = "opa"
  }
}

resource "kubernetes_role" "configmap_modifier" {
  metadata {
    name = "configmap-modifier"
    namespace = "opa"
  }
  rule {
    api_groups = [""]
    resources  = ["configmaps"]
    verbs      = ["update", "patch"]
  }
}



#resource "kubernetes_role_binding" "opa_configmap_modifier" {
#  metadata {
#    name = "opa-configmap-modifier"
#    namespace = "opa"
#  }
#  role_ref {
#    api_group = "rbac.authorization.k8s.io"
#    kind      = "Role"
#    name      = "configmap-modifier"
#  }
#  subject {
#    kind = "Group"
#    name = "system:serviceaccounts:opa"
#  }
#}
#resource "kubernetes_cluster_role_binding" "opa_viewer" {
#  metadata {
#    name = "opa-viewer"
#  }
#  role_ref {
#    api_group = "rbac.authorization.k8s.io"
#    kind      = "ClusterRole"
#    name      = "view"
#  }
#  subject {
#    kind = "Group"
#    name = "system:serviceaccounts:opa"
#    api_group = "rbac.authorization.k8s.io"
#  }
#}




