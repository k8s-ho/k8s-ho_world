module "my_vpc_module" {
	source = "../vpc"
}

resource "aws_instance" "frontend-ubuntu"{
	ami = var.frontend_os
	instance_type = var.frontend_instance_type
	subnet_id = module.my_vpc_module.public_subnet_id
	associate_public_ip_address = true
	
	/* temp
	user_data              = <<-EOF
							#!/bin/bash
							sudo apt-get update
							sudo apt-get install ca-certificates curl gnupg

							sudo install -m 0755 -d /etc/apt/keyrings
							curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
							sudo chmod a+r /etc/apt/keyrings/docker.gpg

							echo \
						    "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
						    "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
						    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

						    sudo apt-get update
						    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
						    sudo systemctl start docker

    */
}

resource "aws_instance" "backend-ubuntu"{
	ami = var.backend_os
	instance_type = var.backend_instance_type
	subnet_id = module.my_vpc_module.private_subnet_id
	associate_public_ip_address = false
}
