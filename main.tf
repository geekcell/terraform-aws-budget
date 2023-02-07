/**
 * # Terraform AWS Budgets
 *
 * This Terraform module provides a preconfigured solution for setting up
 * AWS Budgets for your AWS account. Our team has years of experience working
 * with AWS Budgets, and we are sharing our knowledge with you through this
 * module. With this module, you can quickly and easily set up budgets that
 * align with your organization's goals and get alerts when your usage exceeds
 * your specified limits. By using this module, you can save time and avoid
 * common mistakes when setting up AWS Budgets.
 *
 * Not only is this module easy to configure, but it also encapsulates
 * everything you need in one place. You can simply use the module and be
 * confident that everything has been set up correctly and efficiently.
 *
 * This makes it an excellent choice for organizations of any size looking
 * to effectively manage their AWS costs.
 */
resource "aws_budgets_budget" "main" {
  for_each = { for i, budget in var.budgets : budget.name => budget }

  name = format("%s-%s", var.name, each.value.name)

  budget_type  = each.value.budget_type
  limit_amount = each.value.limit_amount
  limit_unit   = each.value.limit_unit
  time_unit    = each.value.time_unit

  account_id        = data.aws_caller_identity.current.account_id
  time_period_start = each.value.time_period_start
  time_period_end   = each.value.time_period_end

  dynamic "cost_filter" {
    for_each = each.value.cost_filter == null ? [] : [each.value.cost_filter]
    content {
      name   = cost_filter.key
      values = cost_filter.value
    }
  }

  notification {
    comparison_operator       = each.value.notification.comparison_operator
    notification_type         = each.value.notification.notification_type
    subscriber_sns_topic_arns = [module.notification.arn]
    threshold                 = each.value.notification.threshold
    threshold_type            = each.value.notification.threshold_type
  }
}

module "notification" {
  source = "github.com/geekcell/terraform-aws-sns-email-notification?ref=v1.0"

  name            = var.name
  email_addresses = var.recipients

  tags = var.tags
}
