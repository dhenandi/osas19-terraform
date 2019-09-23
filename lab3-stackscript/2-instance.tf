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
    stackscript_id = "${var.stackscriptid}"
}