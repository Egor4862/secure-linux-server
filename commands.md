sudo apt update
sudo apt upgrade
sudo apt install openssh-server
sudo systemctl start ssh
sudo systemctl enable ssh

sudo apt install ufw
sudo ufw allow OpenSSH
sudo ufw enable

sudo apt install fail2ban
sudo systemctl start fail2ban
sudo systemctl enable fail2ban


sudo ufw status
sudo ss -tuln
sudo fail2ban-client status
sudo systemctl is-active ssh
