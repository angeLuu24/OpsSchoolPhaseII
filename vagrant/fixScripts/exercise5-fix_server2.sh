#!/bin/bash
#add fix to exercise5-server2 here
sudo cp /home/vagrant/.ssh/authorized_keys /home/vagrant/.ssh/authorized_keys.pub
sudo chown vagrant:vagrant /home/vagrant/.ssh/authorized_keys.pub
sudo printf 'host *\n\tStrictHostKeyChecking no' > /home/vagrant/.ssh/config
sudo chown vagrant:vagrant /home/vagrant/.ssh/config
sudo printf '#!/bin/bash\nsudo apt-get -y install sshpass' > /home/vagrant/.install_sshpass.sh
sudo chmod +x /home/vagrant/.install_sshpass.sh
sh /home/vagrant/.install_sshpass.sh | wait $!
sudo rm /home/vagrant/.install_sshpass.sh
sshpass -p vagrant ssh-copy-id -i /home/vagrant/.ssh/authorized_keys.pub vagrant@server1
sudo cp /vagrant/.vagrant/machines/server2/virtualbox/private_key /home/vagrant/.ssh/private_key2
sudo chown vagrant:vagrant /home/vagrant/.ssh/private_key2
sudo chmod 600 /home/vagrant/.ssh/private_key2
