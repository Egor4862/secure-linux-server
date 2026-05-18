# Настройка безопасного Linux-сервера

Проект по настройке сервера в виртуальной машине VirtualBox.

## Что сделано:
 Установлен SSH
 Настроен firewall
 Установлен fail2ban

## Как проверить:
```bash
sudo ufw status
sudo ss -tuln
sudo fail2ban-client status
sudo systemctl is-active ssh 
```
## Что еще можно улучшить

1. Настройка SSH:
   Перевести SSH на другой порт (например, `2222`).
   Запретить прямой вход для суперпользователя (`PermitRootLogin no`).

2. Настройка Fail2ban:
   Ужесточить правила и уменьшить количество попыток входа.
