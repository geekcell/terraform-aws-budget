package test

import (
	"github.com/aws/aws-sdk-go/aws"
	"github.com/aws/aws-sdk-go/service/budgets"
	"os"
	"testing"

	TTAWS "github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"

	"github.com/stretchr/testify/assert"

	"github.com/aws/aws-sdk-go/aws/session"
)

func TestTerraformBasicExample(t *testing.T) {
	budgetName := "terraform-test-budget-" + GetShortId()

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../examples/basic-example",
		Vars: map[string]interface{}{
			"name": budgetName,
		},
	})

	//defer terraform.Destroy(t, terraformOptions)

	terraform.InitAndApply(t, terraformOptions)

	sess, err := NewSession(os.Getenv("AWS_REGION"))
	assert.NoError(t, err)

	client := budgets.New(sess)

	input := &budgets.DescribeBudgetInput{BudgetName: &budgetName}
	output, err := client.DescribeBudget(input)
	assert.NoError(t, err)

	assert.Equal(t, budgetName, aws.StringValue(output.Budget.BudgetName))
	assert.Equal(t, "12", aws.StringValue(output.Budget.BudgetLimit.Amount))
}

func NewSession(region string) (*session.Session, error) {
	sess, err := TTAWS.NewAuthenticatedSession(region)
	if err != nil {
		return nil, err
	}

	return sess, nil
}

func GetShortId() string {
	githubSha := os.Getenv("GITHUB_SHA")
	if len(githubSha) >= 7 {
		return githubSha[0:6]
	}

	return "local"
}
