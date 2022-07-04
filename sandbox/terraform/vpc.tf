data "aws_ssm_parameter" "vpc_name" {
  name = "/aft/account-request/custom-fields/vpc_name"
}

data "aws_ssm_parameter" "vpc_cidr" {
  name = "/aft/account-request/custom-fields/vcp_cidr"
}

resource "aws_vpc" "name" {
  cidr_block = data.aws_ssm_parameter.vpc_cidr.value

  tags = {
    name = data.aws_ssm_parameter.vpc_name.value
  }
}
