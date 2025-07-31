# Infra-Cyna

Ce repository contient tous les scripts et configurations liés à l'automatisation de l'infrastructure hybride de Cyna IT :

- Provisioning cloud avec Terraform
- Configuration des serveurs avec Ansible
- Configuration réseau (switches, pare-feux)
- Pipelines CI/CD
- Sauvegardes et PRA

## Arborescence du projet

infra-cyna/
├── terraform/ # Scripts d'infrastructure (Azure, VMs, réseau)
├── ansible/ # Automatisation système et déploiement applicatif
├── network-config/ # Configurations des équipements réseau (pare-feux, switches)
├── cicd/ # Pipelines CI/CD (GitLab, Jenkins)
├── backup/ # Scripts de sauvegarde/restauration
├── docs/ # Documentation technique
└── envs/ # Fichiers .tfvars pour gérer plusieurs environnements