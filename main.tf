variable "region" {
  default = "ap-south-1"
}

provider "aws" {
    //region="ap-south-1"
    region = var.region
}
resource "aws_instance" "instance-1" {
    ami="ami-0f58b397bc5c1f2e8"
    instance_type="t2.micro"
    //vpc_id = aws_vpc.vpc.id
    vpc_security_group_ids = [aws_security_group.sg.id]


    //security_groups = [aws_security_group.sg.name]
    subnet_id     = aws_subnet.sn.id
    tags={
        Name = "Instance-1"
         }
  //  depends_on = [aws_subnet.sn]         
}

resource "aws_instance" "instance-2" {
    ami="ami-05e00961530ae1b55"
    instance_type="t2.micro"
    vpc_security_group_ids = [aws_security_group.sg.id]
    //vpc_id = aws_vpc.vpc.id

   // security_groups = [aws_security_group.sg.name]
    subnet_id     = aws_subnet.sn.id
    tags={
        Name = "Instance-2"
         }
    depends_on = [aws_subnet.sn, aws_security_group.sg]         
}

