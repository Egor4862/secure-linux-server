# Настройка защищённого Linux-сервера

## Цель проекта
Развернуть и защитить Linux-сервер (Ubuntu, VirtualBox) с базовыми мерами по информационной безопасности: SSH-доступ, firewall, защита от брутфорса.

## Технологии
Ubuntu Server, OpenSSH, UFW, Fail2ban

## Что сделано
- Установлен и настроен SSH-доступ
- Настроен firewall (UFW)
- Установлен и настроен fail2ban для защиты от подбора паролей

## Скриншоты проверки
![ufw status](screenshots/ufw_status.png)
![ssh active](screenshots/ssh_active.png)
![fail2ban status](screenshots/fail2ban_status.png)
![ss tuln](screenshots/ss_tuln.png)

## Как воспроизвести
Полный список команд — в [commands.md](https://github.com/Egor4862/linux_lab/blob/main/commands.md)

## Что можно улучшить
- Перевести SSH на нестандартный порт (2222)
- Запретить прямой вход root (PermitRootLogin no)
- Ужесточить правила fail2ban (уменьшить лимит попыток входа maxretry)

## Альтернатива: iptables

Кроме UFW можно настроить те же правила через iptables — более гибкий инструмент. Есть защита от сканирования портов, ограничение количества попыток подключения по SSH и логирование заблокированных пакетов.

Правила — в [`iptables-rules.sh`](iptables-rules.sh)
