# AWS Budgets
variable "budgets" {
  default = [
    {
      name              = "budget-account-monthly"
      budget_type       = "COST"
      limit_amount      = "200"
      limit_unit        = "USD"
      time_period_start = "2023-01-01_00:00"
      time_period_end   = "2087-06-15_00:00"
      time_unit         = "MONTHLY"

      notification = {
        comparison_operator = "GREATER_THAN"
        threshold           = "100"
        threshold_type      = "PERCENTAGE"
        notification_type   = "FORECASTED"
      }
    }
  ]
  description = "The list of budget."
  type = list(object({
    name              = string
    budget_type       = string
    limit_amount      = string
    limit_unit        = string
    time_period_start = string
    time_period_end   = string
    time_unit         = string

    cost_filter = optional(map(list(string)))

    notification = object({
      comparison_operator = string
      threshold           = string
      threshold_type      = string
      notification_type   = string
    })
  }))
}

variable "name" {
  description = "The name of the budget."
  type        = string
}

variable "recipients" {
  description = "The email addresses to send notifications to."
  type        = list(string)
}
