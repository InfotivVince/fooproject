pipeline {
   agent any
  stages {
    stage('Checkout') {
       steps {
               git 'https://github.com/AmerRasheed/fooproject.git'
          }
     }
      stage ('Build') {
              steps {
                     sh "mvn compile"
                }
            }
      stage('Test') {
                steps {
                        sh "mvn test"
                     }
         post {
            always {
                  junit '**/target/surefire-reports/TEST*.xml'
              }
           }
      }
  }
        }
