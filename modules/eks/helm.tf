resource "null_resource" "kubeconfig" {
  depends_on = [aws_eks_node_group.main]

  provisioner "local-exec" {
    command = "aws eks update-kubeconfig --name ${var.env}"
  }
}

resource "null_resource" "metrics-server" {
  depends_on = [null_resource.kubeconfig]

  provisioner "local-exec" {
    command = "kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml"
  }
}

resource "helm_release" "kube-prometheus-stack" {
  depends_on = [null_resource.kubeconfig, helm_release.ingress, helm_release.cert-manager, helm_release.external-dns]
  name       = "kube-prometheus-stack"
  repository = "https://prometheus-community.github.io/helm-charts"
  chart      = "kube-prometheus-stack"


  values = [
    file("${path.module}/helm-config/prom-stack-${var.env}.yml")
  ]


resource "helm_release" "ingress-nginx" {
  depends_on = [null_resource.kubeconfig]
  name       = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"

  values = [
    file("${path.module}/helm-config/ingress.yml")
  ]


  }


resource "helm_release" "cert-manager" {
  depends_on = [null_resource.kubeconfig]
  name       = "cert-manager"
  repository = "https://charts.jetstack.io --force-update"
  chart      = "cert-manager"
  namespace  = "cert-manager"
  create.namespace = "true"


  set {
    name  = "crds.enabled"
    value = "true"
    }
  }

resource "null_resource" "cert-manager-cluster-issuer" {
    depends_on = [null_resource.kubeconfig, helm_release.cert-manager]

    provisioner "local-exec" "cert-manager-cluster-issuer" {
        command = "kubectl apply -f ${path.module}/helm-config/cluster-issuer.yml"

        }
    }
resource "helm_release" "external-dns" {
  depends_on = [null_resource.kubeconfig]
  name       = "external-dns"
  repository = "https://kubernetes-sigs.github.io/external-dns/"
  chart      = "external-dns"
}

resource "helm_release" "argocd" {
  depends_on = [null_resource.kubeconfig, helm_release.ingress, helm_release.cert-manager, helm_release.external-dns]


  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "arogo-cd"
  namespace = "argocd"
  create.namespace = "true"
  wait = "false"

  values = [
    file("${path.module}/helm.config/argocd.yml")
  ]

  set {
    name  = "global-domain"
    value = "argocd-${var.env}.uzma83.shop"
  }