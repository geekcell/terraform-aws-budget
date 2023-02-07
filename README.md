<!-- BEGIN_TF_DOCS -->
[![Geek Cell GmbH](https://raw.githubusercontent.com/geekcell/template-terraform-module/main/docs/assets/logo.svg)](https://www.geekcell.io/)

<!--
Comment in these badges if they apply to the repository.

### Code Quality
[![License](https://img.shields.io/github/license/geekcell/terraform-aws-budgets)](https://github.com/geekcell/terraform-aws-budgets/blob/master/LICENSE)
[![GitHub release (latest tag)](https://img.shields.io/github/v/release/geekcell/terraform-aws-budgets?logo=github&sort=semver)](https://github.com/geekcell/terraform-aws-budgets/releases)
[![Release](https://github.com/geekcell/terraform-aws-budgets/actions/workflows/release.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-budgets/actions/workflows/release.yaml)
[![Validate](https://github.com/geekcell/terraform-aws-budgets/actions/workflows/validate.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-budgets/actions/workflows/validate.yaml)
[![Lint](https://github.com/geekcell/terraform-aws-budgets/actions/workflows/linter.yaml/badge.svg)](https://github.com/geekcell/terraform-aws-budgets/actions/workflows/linter.yaml)

### Security
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-budgets/general)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-budgets&benchmark=INFRASTRUCTURE+SECURITY)

#### Cloud
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-budgets/cis_aws)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-budgets&benchmark=CIS+AWS+V1.2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-budgets/cis_aws_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-budgets&benchmark=CIS+AWS+V1.3)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-budgets/cis_azure)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-budgets&benchmark=CIS+AZURE+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-budgets/cis_azure_13)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-budgets&benchmark=CIS+AZURE+V1.3)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-budgets/cis_gcp)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-budgets&benchmark=CIS+GCP+V1.1)

##### Container
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-budgets/cis_kubernetes_16)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-budgets&benchmark=CIS+KUBERNETES+V1.6)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-budgets/cis_eks_11)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-budgets&benchmark=CIS+EKS+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-budgets/cis_gke_11)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-budgets&benchmark=CIS+GKE+V1.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-budgets/cis_kubernetes)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-budgets&benchmark=CIS+KUBERNETES+V1.5)

#### Data protection
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-budgets/soc2)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-budgets&benchmark=SOC2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-budgets/pci)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-budgets&benchmark=PCI-DSS+V3.2)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-budgets/pci_dss_v321)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-budgets&benchmark=PCI-DSS+V3.2.1)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-budgets/iso)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-budgets&benchmark=ISO27001)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-budgets/nist)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-budgets&benchmark=NIST-800-53)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-budgets/hipaa)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-budgets&benchmark=HIPAA)
[![Infrastructure Tests](https://www.bridgecrew.cloud/badges/github/geekcell/terraform-aws-budgets/fedramp_moderate)](https://www.bridgecrew.cloud/link/badge?vcs=github&fullRepo=geekcell%2Fterraform-aws-budgets&benchmark=FEDRAMP+%28MODERATE%29)

-->



## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_budgets"></a> [budgets](#input\_budgets) | The list of budget. | <pre>list(object({<br>    name              = string<br>    budget_type       = string<br>    limit_amount      = string<br>    limit_unit        = string<br>    time_period_start = string<br>    time_period_end   = string<br>    time_unit         = string<br><br>    cost_filter = optional(map(list(string)))<br><br>    notification = object({<br>      comparison_operator = string<br>      threshold           = string<br>      threshold_type      = string<br>      notification_type   = string<br>    })<br>  }))</pre> | <pre>[<br>  {<br>    "budget_type": "COST",<br>    "limit_amount": "200",<br>    "limit_unit": "USD",<br>    "name": "budget-account-monthly",<br>    "notification": {<br>      "comparison_operator": "GREATER_THAN",<br>      "notification_type": "FORECASTED",<br>      "threshold": "100",<br>      "threshold_type": "PERCENTAGE"<br>    },<br>    "time_period_end": "2087-06-15_00:00",<br>    "time_period_start": "2023-01-01_00:00",<br>    "time_unit": "MONTHLY"<br>  }<br>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the budget. | `string` | n/a | yes |
| <a name="input_recipients"></a> [recipients](#input\_recipients) | The email addresses to send notifications to. | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags to add to the AWS Backup. | `map(any)` | `{}` | no |

## Outputs

No outputs.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.4 |

## Resources

- resource.aws_budgets_budget.main (main.tf#1)
- data source.aws_caller_identity.current (data.tf#1)

# Examples
### Basic Example
```hcl
module "example" {
  source = "../../"
  name   = "my-budget"

  recipients = ["no-reply@example.org"]
}
```
### Advanced Example
```hcl
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
```
<!-- END_TF_DOCS -->
