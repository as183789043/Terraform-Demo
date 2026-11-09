variable "GCP_PROJECT" {
  type        = string
  description = "Google Cloud Platform Project ID"
  default     = "terraform101-514005"
}

variable "REGION" {
  type        = string
  default     = "asia-east1"
  description = "GCP region for resources"
}

variable "function_name" {
  type        = string
  default     = "hello-world-gcfv2"
  description = "Name of the Cloud Functions v2"
}

variable "runtime" {
  type        = string
  default     = "python313"
  description = "Python runtime version"
}

variable "entry_point" {
  type        = string
  default     = "handler"
  description = "Function entry point function name"
}

variable "available_memory" {
  type        = string
  default     = "1024M"
  description = "Memory allocated to the function"
}

variable "timeout_seconds" {
  type        = number
  default     = 60
  description = "Function timeout in seconds"
}

variable "available_cpu" {
  type        = number
  default     = 1
  description = "Function timeout in seconds"
}