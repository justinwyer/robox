install
text
reboot
url --url=https://mirrors.kernel.org/fedora/releases/25/Everything/x86_64/os/
lang en_US.UTF-8
keyboard us
timezone US/Pacific
rootpw --plaintext vagrant
user --name=vagrant --password=vagrant --plaintext
zerombr
autopart --type=plain
clearpart --all --initlabel
bootloader --timeout=1
firewall --enabled --service=ssh
#network --device eth0 --bootproto dhcp --noipv6 --hostname=bazinga.localdomain
authconfig --enableshadow --passalgo=sha512

%packages
@core
%end

%post

# Create the vagrant user account.
/usr/sbin/useradd vagrant
echo "vagrant" | passwd --stdin vagrant

# Make the future vagrant user a sudo master.
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers
echo "vagrant        ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers.d/vagrant
chmod 0440 /etc/sudoers.d/vagrant

%end