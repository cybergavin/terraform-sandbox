variable "resource_groups" {
  type        = list(any)
  description = "A list of Azure Resource Groups with locations and tags"
  default     = []
}
