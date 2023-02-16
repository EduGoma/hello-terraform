pipeline {
  agent any
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
}
