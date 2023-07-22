output "public_subnet_id"{
	value = aws_subnet.pub_subnet_1.id
}

output "private_subnet_id"{
	value = aws_subnet.prv_subnet_1.id
}
