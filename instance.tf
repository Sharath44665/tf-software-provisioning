resource "aws_key_pair" "mykey" {
  key_name = "mykey"
  public_key = "${file("${var.PATH_TO_PUBLIC_KEY}")}"
}

resource "aws_instance" "example" {
  ami = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.mykey.key_name}"

  provisioner "file" {
    source="script.sh"
    destination = "/temp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
        "chmod +x /tmp/script.sh",
        "sudo /tmp/script.sh"
    ]
  }

# this connection using ssh, so in our VPC enable SG inbound for remote IP 
# for example 111.22.22.33/32 in SG
# https://whatismyipaddress.com/
  connection {
    user="${var.INSTANCE_USERNAME}"
    private_key="${file("${var.PATH_TO_PRIVATE_KEY}")}"
  }
}