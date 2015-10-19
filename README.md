# infra
Infrastructure deployment and automation scripts

## Requirements

* [Ansible](http://www.ansible.com/)
* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)

## Usage

1. `git clone https://github.com/erudit/infra.git`
2. `cd infra/ansible/`
3. `vagrant up`
4. `ansible-playbook site.yml`

## Application

- MariaDB
- PostgreSQL
- Tomcat
- SOLR
- Fedora-Commons
- Apache
- Nginx
- Gitlab
- Odoo
- Redmine
- Munin & Munin-node
