variable "project_name" {
  description = "Prefix for local Docker resources"
  type        = string
  default     = "lab7"
}

variable "image_name" {
  description = "Existing local FastAPI image"
  type        = string
  default     = "fastapi-lab:lab7"
}

variable "container_port" {
  description = "Port inside the container"
  type        = number
  default     = 8000
}

variable "host_port" {
  description = "Port exposed on localhost"
  type        = number
  default     = 8087

  validation {
    condition     = var.host_port >= 1024 && var.host_port <= 65535 && floor(var.host_port) == var.host_port
    error_message = "Use an integer port between 1024 and 65535."
  }
}

variable "second_host_port" {
  description = "Host port for the second FastAPI container"
  type        = number
  default     = 8089
}
