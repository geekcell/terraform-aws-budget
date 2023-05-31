variable "name" {
  default     = "my-bucket"
  description = "Bucket name."
  type        = string
}

variable "recipients" {
  default     = ["no-reply@example.org"]
  description = "Recipients for notifications"
  type        = list(string)
}

variable "amount" {
  default     = "50"
  description = "Limit amount."
  type        = string
}

variable "amount_unit" {
  default     = "EUR"
  description = "Limit amount unit."
  type        = string
}
