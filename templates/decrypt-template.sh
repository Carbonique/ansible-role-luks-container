sudo cryptsetup luksOpen {{ loopfile_full_path }} {{ loopfile_name }}
sudo mount /dev/mapper/{{ loopfile_name }}-mapper {{ mount_directory }}

echo
echo "luksOpen done"
echo
sleep 5
read -p "Wil je alle docker container starten? (y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

read -p "Nogmaals bevestigen (y/n) " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

sudo docker start $(sudo docker ps -q)