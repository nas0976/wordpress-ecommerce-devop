pipeline {
    agent any

    stages {
        stage('Vérification du code') {
            steps {
                echo 'Vérification du dépôt Git et des fichiers IaC...'
                sh 'git status'
            }
        }

        stage('Validation Terraform') {
            steps {
                dir('terraform') {
                    echo 'Initialisation et validation du plan Terraform...'
                    sh 'terraform init -backend=false'
                    sh 'terraform validate'
                }
            }
        }

        stage('Vérification Ansible') {
            steps {
                dir('ansible') {
                    echo 'Vérification de la syntaxe du playbook Ansible...'
                    sh 'ansible-playbook -i inventory.ini playbook.yml --syntax-check'
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline CI/CD exécuté avec succès !'
        }
        failure {
            echo 'Le pipeline a échoué. Veuillez vérifier les logs.'
        }
    }
}
