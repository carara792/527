
provider "aws" {
  region = "us-east-1"
}

module "ec2_with_mandatory_tagging" {
  source  = "github.com/cloudtp/hello-terraform-module"
}

data "aws_ssm_parameter" "cathay_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "cathay-web" {
   ami = data. aws_ssm_parameter.cathay_ami.value
   instance_type = "t3.micro"
    monitoring = true
   tags = {
       Name = "lab-server-1"
   }

   user_data = fileexists("script.sh") ? file("script.sh") : null
}