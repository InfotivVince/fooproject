pipeline {
  agent any 
  stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/EbrosGaming/fooproject.git'
            }
        }
    }
  stages {
    stage('Build') {
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
        junit '**/TEST*.xml'
      }
     }
      
  }
 }
}
