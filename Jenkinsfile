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
     
     
     
           stage('newman') {
            steps {
                sh 'newman run Restful_Booker.postman_collection.json --environment Restful_Booker.postman_environment.json --reporters junit'
                            
             
            }
            post {
                always {
                        junit '**/*xml'
                    }
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

