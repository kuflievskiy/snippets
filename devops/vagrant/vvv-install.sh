https://github.com/Varying-Vagrant-Vagrants/VVV

mkdir testdir
cd testdir
git clone git://github.com/Varying-Vagrant-Vagrants/VVV.git .
vagrant plugin install vagrant-hostsupdater
vagrant plugin install vagrant-triggers
vagrant plugin install vagrant-vbguest
vagrant up
