# postgres-backups

## Что мы автоматизируем?
* Установка Docker и Docker-compose
* Создание и настройка пользователя
    * Создание пользователя
    * Настройка подключения по SSH-ключу
    * Отключение аутентификации для root пользователя и аутентификации по паролю
* Установка дополнительных пакетов (vim, ufw, zip, unzip)
* Настройка брандмауэра для подключения по SSH

</br>

## Использование
1. Изменение информации о серверах, которые необходимо настроить в`host.ini`.
```bash
[servers]
master ansible_host=000.000.000.000 ansible_user=root ansible_port=22 ansible_password=qwerty123
slave1 ansible_host=000.000.000.000 ansible_user=root ansible_port=22 ansible_password=qwerty123
slave2 ansible_host=000.000.000.000 ansible_user=root ansible_port=22 ansible_password=qwerty123
```


2. Я ленив, поэтому везде будет один пароль пользователя. Внесите изменения в файл `config.yml`.

> PS: я шучу, лучше не лениться и запускать этот скрипт для каждого сервера отдельно, заменяя логин и пароль

```bash
vars:
    created_username: "ADMIN_ULTRA_PRO"
    created_pass: "SUPER_SECURE_PASSWORD"
```

3. Сначала подключитесь к каждому серверу через ssh
4. Затем проверьте, правильно ли подключается ansible
```bash
ansible -i hosts.ini -m ping servers
```
5. А теперь запустите скрипт и наслаждайтесь ))
```bash
ansible-playbook -i hosts.ini config.yml
```