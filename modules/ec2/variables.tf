variable "frontend_instance_type"{
	description = "frontend instance의 type 설정"
	type = string
	default = "t2.micro"
}

variable "frontend_os"{
	description = "frontend instance의 os 설정"
	type = string
	default = "ami-0225bc2990c54ce9a" # ubuntu 20.04 (64bit, x86)
}

variable "backend_instance_type"{
	description = "backend instance의 type 설정"
	type = string
	default = "t2.micro"
}

variable "backend_os"{
	description = "backend instance의 os 설정"
	type = string
	default = "ami-0225bc2990c54ce9a" # ubuntu 20.04 (64bit, x86)
}
