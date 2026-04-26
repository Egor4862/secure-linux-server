Настройка безопасного Linux-сервера

Проект по настройке Ubuntu-сервера в виртуальной машине VirtualBox.

Сделано

 установлен SSH
 
 настроен firewall (UFW)
 
 установлен fail2ban

Проверка

 sudo ufw status
 
 sudo ss -tuln
 
 sudo fail2ban-client status-
 
 sudo systemctl is-active ssh


