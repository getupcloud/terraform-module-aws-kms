variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
}

variable "customer_name" {
  description = "customer name"
  type        = string
}

variable "account_id" {
  description = "account id aws name"
  type        = string
}

variable "region" {
  description = "region name"
  type        = string
}

variable "key_id" {
  description = "AWS KMS ID to flux automatically handle"
  type        = string
}

variable "cluster_oidc_issuer_url" {
  description = "URL of the OIDC Provider from the EKS cluster"
  type        = string
}

variable "service_account_namespace" {
  description = "Namespace of ServiceAccount for flux-system"
  default     = "flux-system"
}

variable "service_account_name" {
  description = "ServiceAccount name for flux-system"
  default     = "kustomize-controller"
}

variable "tags" {
  description = "AWS tags to apply to resources"
  type        = any
  default     = {}
}
