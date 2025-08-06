# Projet Infra-CYNA

Infrastructure hybride (on-premise + cloud) pour le projet DevOps de l'entreprise CYNA.

Ce dépôt contient tout le code d'infrastructure en tant que code (IaC), l'automatisation de la configuration des services, la supervision, les sauvegardes, ainsi qu'un plan de reprise d'activité (PRA).

---

## Structure du projet

infra-cyna/
├── ansible/ # Playbooks et rôles Ansible
│ ├── site.yml # Déploiement principal
│ ├── restore.yml # Déclenchement PRA
│ ├── restores/ # Scénarios de restauration automatisée
│ ├── roles/ # Rôles Ansible (graylog, gitlab, prometheus...)
│ └── inventories/ # Fichiers d'inventaire (hosts)
├── terraform/ # Scripts Terraform (provisionnement des VMs)
├── docs/ # Documentation interne
│ └── PRA.md # Détails sur la reprise après sinistre
└── .gitlab-ci.yml # Pipeline CI/CD GitLab

---

## Fonctionnalités

### Déploiement automatisé
- Installation et configuration de :
  - Graylog (avec MongoDB & OpenSearch)
  - Stack de monitoring (Prometheus, Grafana, Node Exporter)
  - GitLab Community Edition

### Plan de Reprise d’Activité (PRA)
- Restauration automatique des services critiques avec Ansible + Terraform
- Playbook interactif `restore.yml`

### CI/CD
- Pipeline GitLab pour valider la syntaxe des playbooks Ansible
- Possibilité de déploiement automatisé via GitLab Runner

---

## Commandes utiles

### Lancer le déploiement principal :

```bash
ansible-playbook -i inventories/dev/hosts site.yml


