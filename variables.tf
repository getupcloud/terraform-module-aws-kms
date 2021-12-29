variable "cluster_name" {
  description = "EKS Cluster name"
  type        = string
}

variable "customer_name" {
  description = "customer name"
  type        = string
}

variable "customer_name" {
  description = "customer name"
  type        = string
}

variable "customer_name" {
  description = "customer name"
  type        = string
}

variable "kms_id" {
  description = "AWS KMS ID to flux automatically handle"
  type        = string

  validation {
    condition     = length(var.key_id) > 0
    error_message = "The key_id value must not be empty."
  }
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
