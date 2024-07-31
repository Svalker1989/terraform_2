###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "public_cidr" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "private_cidr" {
  type        = list(string)
  default     = ["192.168.20.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "nat-instance" {
  type        = string
  default     = "nat-instance"
}

variable "vpc_name" {
  type        = string
  default     = "netology"
  description = "VPC network&subnet name"
}

variable "vpc_name_public" {
  type        = string
  default     = "public"
  description = "VPC network&subnet name"
}

variable "vpc_name_private" {
  type        = string
  default     = "private"
  description = "VPC network&subnet name"
}

variable "sg_nat_name" {
  type        = string
  default     = "nat-instance-sg"
}

variable "os_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "os_family"
}

variable "platform_id" {
  type        = string
  default     = "standard-v1"
  description = "platform_id"
}

variable "vms_ssh_key" {
  type        = string
  description = "ssh-key"
}

###ssh vars

/*variable "vms_ssh_public_root_key" {
  type        = string
  description = "user ssh public key"
}*/