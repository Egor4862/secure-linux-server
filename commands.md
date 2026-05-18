# Список команд для настройки сервера

1. Обновление системы
```bash
sudo apt update
sudo apt upgrade
```
2. Установка и запуск SSH
```bash
sudo apt install openssh-server
sudo systemctl start ssh
sudo systemctl enable ssh
```
3. Настройка файрвола (UFW)
```bash
sudo apt install ufw
sudo ufw allow OpenSSH
sudo ufw enable
```
4. Установка и запуск Fail2ban
```bash
sudo apt install fail2ban
sudo systemctl start fail2ban
sudo systemctl enable fail2ban
```
5. Команды для проверки статуса
```bash
sudo ufw status
sudo ss -tuln
sudo fail2ban-client status
sudo systemctl is-active ssh
```
