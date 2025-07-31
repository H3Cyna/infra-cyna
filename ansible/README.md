# Automatisation avec Ansible – Projet Cyna IT

Ce dossier contient tous les rôles Ansible pour automatiser la configuration des VMs, des services réseau, et des outils DevOps.

## Structure

- `inventories/` : fichiers d'inventaire par environnement (dev, preprod, prod)
- `roles/` : rôles Ansible modulaires
- `site.yml` : playbook principal pour exécuter l’ensemble

## Utilisation

```bash
ansible-playbook -i inventories/dev/hosts site.yml
