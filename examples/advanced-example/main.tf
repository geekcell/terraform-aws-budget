module "advanced-example" {
  source = "../../"
  name   = "my-budget"

  budgets = [
    {
      name              = "ec2-rds-monthly-in-eu-central-1"
      budget_type       = "COST"
      limit_amount      = "200"
      limit_unit        = "USD"
      time_period_start = "2023-01-01_00:00"
      time_period_end   = "2087-06-15_00:00"
      time_unit         = "MONTHLY"

      cost_filter = {
        "Service" = [
          "Amazon Elastic Compute Cloud - Compute",
          "Amazon Relational Database Service"
        ]
        "Region" = [
          "eu-central-1"
        ]
      }

      notification = {
        comparison_operator = "GREATER_THAN"
        threshold           = "80"
        threshold_type      = "PERCENTAGE"
        notification_type   = "FORECASTED"
      }
    }
  ]

  recipients = ["no-reply@example.org"]
}
