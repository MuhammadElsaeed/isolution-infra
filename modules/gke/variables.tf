
variable "cluster_name" {
  type        = string
}

variable "zone" {
  type        = string
  default = "us-east1-a"
}

variable "network" {
  type        = string
}

variable "subnetwork" {
  type        = string
}

variable "initial_node_count" {
  type        = number
  default     = 1
}

variable "disk_size_gb" {
  type        = number
  default     = 30
}

variable "spot_instances" {
  type        = bool
  default     = true
}

variable "machine_type" {
  type        = string
  default = "e2-micro"
}

variable "enable_private_nodes" {
  type        = bool
  default     = true
}

variable "enable_private_endpoint" {
  type        = bool
  default     = true
}

