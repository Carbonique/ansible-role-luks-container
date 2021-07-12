- [About](#about)
- [Requirements](#requirements)
- [Variables](#variables)

# About

This role setups an Luks encrypted container 

The role creates a loopback file which is then encrypted and mounted to a directory specified by the user, additionaly a bash script is generated to mount or unmount the container after creation. This is useful, as the container does not automount and needs to be mounted again after a reboot, for example. Finally, the role creates a backup of the Luks header and fetches the header to the Ansible controller.

# Requirements

- [`community.crypto.luks_device`](https://docs.ansible.com/ansible/latest/collections/community/crypto/luks_device_module.html) on Ansible controller

# Variables

For defaults see `defaults/main.yml`.

| Variable           | Description                                                                                                    | Default               | Optional/Required |
|--------------------|----------------------------------------------------------------------------------------------------------------|-----------------------|-------------------|
| mount_directory    | Path where to mount the encrypted container. Will be created if  it does not exist                             | null                  | Required          |
| loopfile_name         | Name of the .img file without .img extension (has to be unique)                                                | encrypted_img         | Required          |
| loopfile_path         | Path where to store the .img file without ending slash (has to be unique).                                     | /home/{{ user }}      | Required          |
| loopfile_size         | Size of the encrypted loopfile in MB's                                                                            | 50                    | Required          |
| container_name     | Name of the `.img` container file  (has to be unique)                                                          | encrypted_container   | Required          |
| container_password | Password for the encrypted container                                                                           | null                  | Required          |
| user_PUID          | UID used when creating the `mount_directory`, `loopfile_path`, and `luks_directory`                               | {{ ansible_user }}    | Required          |
| user_PGID          | GID used when creating the `mount_directory`, `loopfile_path`, and `luks_directory`                               | {{ ansible_user }}    | Required          |
| luks_directory     | Directory in which the mount script and Luks header backups are stored.  Will be created if it does not exist. | {{ loopfile_path }}/luks | Required          |