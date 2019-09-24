provider "linode" {
    token = "YOUR TOKEN HERE"
}

resource "linode_sshkey" "opensusekey" {
    label = "opensuse-asus-pub-key"
    ssh_key = "${chomp(file("~/.ssh/id_rsa.pub"))}"
}


resource "linode_instance" "terraformtest" {
    label = "linode-test"
    region = "ap-south"
    image = "linode/opensuse15.1"
    type = "g6-nanode-1"
    root_pass = "openSUS3"
    authorized_keys = [ "${linode_sshkey.opensusekey.ssh_key}" ]
}