sudo cryptsetup luksOpen {{ loopfile_full_path }} {{ loopfile_name }}
sudo mount /dev/mapper/{{ loopfile_name }}-mapper {{ mount_directory }}
