module "IAM_module" {
  source   = "../resource"
  for_each = var.terraform
  name     = each.key
#   ami=  each.key.user_ami
  # region=var.awsregion
  tag-key = each.value.role_tag-key
  Action = each.value.role_action
  Effect = each.value.role_Effect
  service = each.value.role_service
  path  = each.value.policy_path
  description = each.value.policy_description


}