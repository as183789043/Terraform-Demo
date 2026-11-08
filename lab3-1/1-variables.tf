variable "REGION" {
  type        = string
  description = "專案對應區域"
  default     = "us-west1"
}

variable "GCP_PROJECT" {
  type        = string
  description = "專案ID"
  default     = "terraform101-514005"
}

variable "gsa_account_id" {
  type        = string
  description = "google service account 名稱"
  default     = "my-custom-sa"
}


variable "gce_name" {
  type        = string
  description = "gce 主機名稱"
  default     = "my-gce"
}

variable "gce_machine_type" {
  type        = string
  description = "gce主機機型"
  default     = "e2-micro"
}

variable "gce_zone" {
  type        = string
  description = "主機所在可用區"
  default     = "us-west1-a"
}

variable "gce_tags" {
  type        = list(string)
  description = "自定義標記"
  default     = ["dev"]
}

variable "gce_image" {
  type        = string
  description = "開機映像檔"
  default     = "ubuntu-2404-noble-amd64-v20261105"
}


variable "gce_network" {
  type        = string
  description = "主機所在網段"
  default     = "default"
}



variable "disk_name" {
  type        = string
  description = "區域磁碟的名稱"
  default     = "my-region-disk"
}

variable "disk_type" {
  type        = string
  description = "磁碟類型 (例如 pd-ssd, pd-standard)"
  default     = "pd-standard"
}

variable "disk_region" {
  type        = string
  description = "磁碟所在的 GCP 區域"
  default     = "us-west1"
}

variable "disk_size" {
  type        = number
  description = "磁碟大小 (GB)"
  default     = 200
}

variable "replica_zones" {
  type        = list(string)
  description = "區域磁碟要同步的備份區域清單"
  default     = ["us-west1-a", "us-west1-b"]
}