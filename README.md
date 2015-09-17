# infra
Infrastructure deployment and automation scripts

## Application

- MariaDB
- PostgreSQL
- Tomcat
- SOLR
- Fedora-Commons
- Nginx
- Gitlab

## Usage

1. `git clone https://github.com/erudit/infra.git`
2. `cd infra`
3. `vagrant up`
4. `ansible-playbook all.yml --ask-vault-pass`

## Requirements

* [Ansible](http://www.ansible.com/)
* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)
