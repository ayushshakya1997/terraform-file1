#creating user 
resource "aws_iam_user" "users"{
name = var.name

}

  


# creating iam role

resource "aws_iam_role" "user_role" {
 
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action =  var.Action               
        # sts:AssumeRole
        Effect = var.Effect
        #"Allow"
        Sid    = ""
        Principal = {
          Service = var.service
        }
      },
    ]
  })

  tags = {
    tag-key = var.tag-key
  }
}

#creating Iam Policy
resource "aws_iam_policy" "user_policy" { 
  
  path        = var.path
  description = var.description

  
    policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "ec2:Describe*",
        ]
        Effect   = var.Effect
        Resource = "*"
      },
    ]
  })
}


