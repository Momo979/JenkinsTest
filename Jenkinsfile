pipeline {
  agent { label 'linux' }
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('Dockerhub-token')
    registry = "momo979/purple-beard-team-2"
    dockerimage = ''
  }
  stages {
    stage('Build') {
      steps {
        dockerimage = 'docker build -t registry + ":$BUILD_NUMBER"
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push dockerimage()'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}

