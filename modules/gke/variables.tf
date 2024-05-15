
variable "cluster_name" {
  type        = string
}

variable "zone" {
  type        = string
  default = "us-east1-b"
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
  default     = false
}

variable "master_ipv4_cidr_block" {
  type        = string
}

variable "cluster_ipv4_cidr_block" {
  type        = string
}

variable "services_ipv4_cidr_block" {
  type = string
}