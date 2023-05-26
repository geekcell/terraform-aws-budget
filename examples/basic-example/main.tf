module "example" {
  source = "../../"

  name = var.name

  recipients = ["no-reply@example.org"]
}
