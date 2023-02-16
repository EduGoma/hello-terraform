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
        sh "docker tag ghcr.io/edugoma/hello-terraform:latest ghcr.io/edugoma/hello-terraform:1.0.${BUILD_NUMBER}" 
        sshagent(['Git-hubSSH']) {
          sh "git push --tags"
        }
      }
    }
    stage('Package'){
      steps{
        withCredentials([string(credentialsId: 'github-token', variable: 'CR_PAT')]) {
            sh "echo $CR_PAT | docker login ghcr.io -u edugoma --password-stdin"
            sh 'docker-compose push'
            sh "docker push ghcr.io/edugoma/hello-terraform:1.0.${BUILD_NUMBER}"
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
          sh "terraform apply -auto-approve"        
        }
      }
    }
    stage('Ansible Apply') {
      steps {
        withAWS(credentials: 'AWS-credential') {
          sshagent(['ssh-amazon']) {
            sh """cd ansible 
            ansible-playbook -i aws_ec2.yaml hello-ansible.yaml"""
          }
        }
      }                
    }
    stage('Deploy') {
      steps {            
        sshagent(['ssh-amazon']) {
          sh """ssh ec2-user@176.34.77.107 docker-compose up -d"""
        }
      }    
    }
  }   
}
