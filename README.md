- [About](#about)
- [Requirements](#requirements)
- [Installation](#installation)
- [Defaults](#defaults)

# About

This role setups an Luks encrypted container 

The role creates a loopback file which is then encrypted and mounted to a directory specified by the user, additionaly a bash script is generated to mount or unmount the container after creation. This is useful, as the container does not automount and needs to be mounted again after a reboot, for example. Finally, the role creates a backup of the Luks header and fetches the header to the Ansible controller.

# Requirements

- [`community.crypto.luks_device`](https://docs.ansible.com/ansible/latest/collections/community/crypto/luks_device_module.html) on Ansible controller

# Installation

Add the following to `requirements.yml`:

```
- src: https://github.com/carbonique/ansible-role-luks-container.git
  scm: git
  name: luks-container
  version: #Leave empty for latest. To download a specific version: use the tag as listed in repo
```

For system wide installation:
`ansible-galaxy install -r requirements.yml`

For installation to the current directory:
`ansible-galaxy install --roles-path . -r requirements.yml`

# Defaults

Defaults have been prefilled. Variables have to be added by user

For defaults see: `defaults/main.yml`
For variables see: `vars/main.yml`
