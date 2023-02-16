pipeline {
  agent any
  options {
    ansiColor('css')
    timestamps()
   }
  stages{
    stage('Build images') {
      steps {
        sh 'docker-compose build'
        sh "git tag 1.0.${BUILD_NUMBER}" 
        sh "docker tag ghcr.io/edugoma/hello-terraform:latest ghcr.io/edugoma/hello-2048:1.0.${BUILD_NUMBER}" 
        sshagent(['Git-hubSSH']) {
          sh "git push --tags"
        }
      }
    }
    stage('Terraform Init') {
      steps {
        withAWS(credentials: 'AWS-credential') {
          sh "terraform init"
        }
      }
    }
    stage('Terraform Plan') {
      steps {
        withAWS(credentials: 'AWS-credential') {
          sh "terraform fmt"
          sh "terraform validate"
          sh "terraform plan"
        }
      }
    }
    stage('Terraform Apply') {
      steps {
        withAWS(credentials: 'AWS-credential') {
          sshagent(['ssh-amazon']) {
            sh "terraform apply -auto-approve"
          }           
        }
      }
    }
  }   
}
