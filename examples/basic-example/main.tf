module "basic-example" {
  source = "../../"
  name   = var.name

  recipients = var.recipients

  budgets = [
    {
      name = var.name

      budget_type  = "COST"
      limit_amount = var.amount
      limit_unit   = var.amount_unit

      time_period_start = "2023-01-01_00:00"
      time_period_end   = "2087-06-15_00:00"
      time_unit         = "MONTHLY"

      notification = {
        comparison_operator = "GREATER_THAN"
        threshold           = "80"
        threshold_type      = "PERCENTAGE"
        notification_type   = "FORECASTED"
      }
    }
  ]
}
