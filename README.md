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

| Variable           | Description                                                                                                    | Default                  | Optional/Required |   |
|--------------------|----------------------------------------------------------------------------------------------------------------|--------------------------|-------------------|---|
| mount_directory    | Path to mount the Luks container on. Will be created if  it does not exist                                     | null                     | Required          |   |
| loopfile_name      | Name of the loopfile                                                                                           | encrypted_img            | Required          |   |
| loopfile_path      | Path to store the loopfile in                                                                                  | /home/{{ user }}         | Required          |   |
| loopfile_size      | Size of the loopfile in MB's (22 MB minimum)                                                                   | 50                       | Required          |   |
| container_password | Password for the encrypted container                                                                           | null                     | Required          |   |
| user_PUID          | UID used when creating the `mount_directory`, `loopfile_path`, and `luks_directory`                            | {{ ansible_user }}       | Required          |   |
| user_PGID          | GID used when creating the `mount_directory`, `loopfile_path`, and `luks_directory`                            | {{ ansible_user }}       | Required          |   |
| luks_directory     | Directory in which the mount script and Luks header backups are stored.  Will be created if it does not exist. | {{ loopfile_path }}/luks | Required          |   |
| cipher             | Cipher to use in encryption                                                                                    | null                     | Required          |   |
| hash               | Encryption hash                                                                                                | sha256                   | Required          |   |
| key_size           | Key-size used                                                                                                  | 256                      | Required          |   |
| sector_size        | Sector size used                                                                                               | null                     | Required          |   |