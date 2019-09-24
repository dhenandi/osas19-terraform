resource "linode_sshkey" "opensusekey" {
    label = "opensuse-asus-pub-key"
    ssh_key = "${chomp(file("~/.ssh/id_rsa.pub"))}"
}

resource "linode_instance" "terraformtest" {
    label = "${var.label}"
    region = "${var.region}"
    image = "${var.image}"
    type = "${var.type}"
    root_pass = "${var.rootpass}"
    authorized_keys = [ "${linode_sshkey.opensusekey.ssh_key}" ]

    provisioner "file" {
        source      = "install.sh"
        destination = "/tmp/install.sh"
    }

    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/install.sh",
            "/tmp/install.sh",
        ]
    }

    connection {
        host     = "${linode_instance.terraformtest.ip_address}"
        type     = "ssh"
        user     = "root"
        password = "${var.rootpass}" 
    }

}