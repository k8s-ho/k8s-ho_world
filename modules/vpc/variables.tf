variable "vpc_cidr_block"{
	description = "CIDR Block을 지정하여 VPC의 IP 주소범위 설정"
	type = string
	default = "192.168.0.0/16"
}

variable "pub_subnet_cidr_block"{
	description = "CIDR 블록을 지정하여 public subnet의 IP 주소범위 설정"
	type = string
	default = "192.168.1.0/24"
}

variable "prv_subnet_cidr_block"{
	description = "CIDR 블록을 지정하여 private subnet의 IP 주소범위 설정"
	type = string
	default = "192.168.11.0/24"
}

variable "availability_zone" {
	description = "VPC와 연결할 subent의 가용 영역 설정"
	type= string
	default = "ap-northeast-2a"
}
