// https://developer.hashicorp.com/terraform/language/settings/backends/s3

/*
terraform {
  backend "remote" {
    organization = "org-name-here"

    workspaces {
      name = "workspace-name-here"
    }
  }
}
*/
/*
terraform {
  cloud {
    organization = "ORGNAME"

    workspaces {
      name = "test_tf_workspace"
    }
  }
}
*/

terraform {
  backend "s3" {
    bucket = "aws-devops-testbucket"
    key    = "terraformstates/dev.tfstate"
    region = "us-east-1"
  }
}