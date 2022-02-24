pipeline {
  agent { label 'linux' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('Dockerhub-token')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t Momo979/image:latest .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push Momo979/image:latest'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}

