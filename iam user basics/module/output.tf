output "iam_role2" {
    value = {for k,v in module.IAM_module: k=>v}

}