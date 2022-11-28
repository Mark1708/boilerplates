# postgres-backups

## What are we automating?
* Installing Docker and Docker-compose
* Creating and configuring a user
    * Creating a user
    * Setting up an SSH key connection
    * Turning off authentication for root and password authentication
* Installing additional packages (vim, ufw, zip, unzip)
* Configuring the firewall for SSH connection

</br>

## Using
1. Changing the information about the servers that need to be configured in `host.ini`.
```bash
[servers]
master ansible_host=000.000.000.000 ansible_user=root ansible_port=22 ansible_password=qwerty123
slave1 ansible_host=000.000.000.000 ansible_user=root ansible_port=22 ansible_password=qwerty123
slave2 ansible_host=000.000.000.000 ansible_user=root ansible_port=22 ansible_password=qwerty123
```


2. I'm lazy so there will be one user password everywhere. Make changes in the `config.yml` file.

> PS: I'm kidding, it's better not to be lazy and run this script for each server separately replacing the username and password

```bash
vars:
    created_username: "ADMIN_ULTRA_PRO"
    created_pass: "SUPER_SECURE_PASSWORD"
```

3. First, connect to each server via ssh
4. Then check if ansible is connecting correctly
```bash
ansible -i hosts.ini -m ping servers
```
5. And now run the script and enjoy the moment
```bash
ansible-playbook -i hosts.ini config.yml
```