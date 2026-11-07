variable "REGION" {
  type        = string
  description = "專案對應區域"
  default     = "asia-east1"
}

variable "GCP_PROJECT" {
  type        = string
  description = "專案ID"
  default     = "terraform101-514005"
}


variable "network_name" {
  type        = string
  description = "VPC 網路名稱"
  default     = "custom-vpc"
}

variable "jp_subnet_name" {
  type        = string
  description = "日本子網路名稱"
  default     = "jp-subnet"
}

variable "jp_subnet_cidr" {
  type        = string
  description = "日本子網路 CIDR 範圍"
  default     = "10.0.0.0/24"
}

variable "jp_region" {
  type        = string
  description = "日本子網路部署區域"
  default     = "asia-northeast1"
}


variable "sg_subnet_name" {
  type        = string
  description = "新加坡子網路名稱"
  default     = "sg-subnet"
}

variable "sg_subnet_cidr" {
  type        = string
  description = "新加坡子網路 CIDR 範圍"
  default     = "10.0.3.0/24"
}

variable "sg_region" {
  type        = string
  description = "新加坡子網路部署區域"
  default     = "asia-southeast1"
}

variable "firewall_rule_name" {
  type        = string
  description = "防火牆規則名稱"
  default     = "common-port"
}

variable "firewall_ports" {
  type        = list(string)
  description = "防火牆開放的連接埠"
  default     = ["22", "443", "3389"]
}

variable "firewall_source_tags" {
  type        = list(string)
  description = "防火牆生效的來源標籤"
  default     = ["demo"]
}