pipeline {
    agent any
    stages {
        stage('Build') {
            steps {

                }
                
            }
        }
         stage('Package'){
             steps{

                }
            }
        }
        stage('Deploy') {
            steps {            
                withAWS(credentials: 'AWS-credential', region: 'eu-west-1') {
                    // some block
                }
                }
            }
        }
    }
}
