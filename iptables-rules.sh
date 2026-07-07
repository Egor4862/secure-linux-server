# NULL пакеты
iptables -A INPUT -p tcp --tcp-flags ALL NONE -j DROP

# Syn flood attack
iptables -A INPUT -p tcp ! --syn -m state --state NEW -j DROP

# Блокируем Christmas tree аттаку
iptables -A INPUT -p tcp --tcp-flags ALL ALL -j DROP

# HTTP/HTTPS
iptables -A INPUT -i ens33 -p tcp --dport 80 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A INPUT -i ens33 -p tcp --dport 443 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o ens33 -p tcp --sport 80 -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o ens33 -p tcp --sport 443 -m state --state ESTABLISHED -j ACCEPT

# Разрешить все входящие SSH соединения и дропаем на час все попытки подключиться при более чем 10-ти неудачных попыток. 
iptables -A INPUT -i ens33 -p tcp --dport 22 -m state --state NEW -m recent --set --name SSH
iptables -A INPUT -i ens33 -p tcp --dport 22 -m state --state NEW -m recent --update --seconds 60 --hitcount 11 --rttl --name SSH -j DROP
iptables -A INPUT -i ens33 -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o ens33 -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT

# HTTP/HTTPS (80/443)
iptables -A INPUT -i ens33 -p tcp --sport 80 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i ens33 -p tcp --sport 443 -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o ens33 -p tcp --dport 80 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o ens33 -p tcp --dport 443 -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

# DNS траффик
iptables -A INPUT -i ens33 -p udp --sport 53 -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o ens33 -p udp --dport 53 -m state --state NEW,ESTABLISHED -j ACCEPT

# Локальные подключения
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

# Логирование
# Создание новых цепочек
iptables -N LOGINPUT
iptables -N LOGOUTPUT
# Правила для новых цепочек INPUT и OUTPUT и перенаправление правила в LOGINPUT и LOGOUTPUT
iptables -A INPUT -j LOGINPUT
iptables -A OUTPUT -j LOGOUTPUT
# Модуль limit
# Логи будут записаны в /var/log/messages (–log)
iptables -A LOGINPUT -m limit --limit 4/min -j LOG --log-prefix "DROP INPUT: " --log-level 4
iptables -A LOGOUTPUT -m limit --limit 4/min -j LOG --log-prefix "DROP OUTPUT: " --log-level 4

# Дропаем все остальное. 
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP
