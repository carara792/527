
provider "aws" {
  region = "us-east-1"
}

data "aws_ssm_parameter" "cathay_ami" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
}

resource "aws_instance" "cathay-web" {
   ami = data. aws_ssm_parameter.cathay_ami.value
   instance_type = "t3.micro"

   tags = {
       Name = "lab-server-1"
   }
}