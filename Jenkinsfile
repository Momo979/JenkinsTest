pipeline {
  agent { label '' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub-token')
  }
  stages {
    stage('Build') {
      steps {
        sh 'docker build -t momo979/purple-beard-team-2:latest .'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push momo979/purple-beard-team-2:latest'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
