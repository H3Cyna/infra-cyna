# Plan de Reprise d’Activité (PRA)

Ce dossier contient les playbooks de restauration automatique des services critiques en cas de sinistre.

## Services pris en charge

- Graylog
- Prometheus
- GitLab

## Utilisation

Depuis le dossier `ansible/`, exécute :

```bash
ansible-playbook restore.yml
