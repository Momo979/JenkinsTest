pipeline {
environment {
      registry = "momo979/purple-beard-team-2"
      registryCredential = 'dockerhub-token'
      dockerImage = ''
}
      agent any
      stages {
            stage('Cloning our Git') {
                  steps {
                     git 'https://github.com/Momo979/JenkinsTest.git'
}
}
      stage('Building our image') {
            steps{
                  script {
                        dockerImage = docker.build registry + ":$BUILD_NUMBER"
}
}
      stage('Login') {
            steps {
             sh 'echo $registry_CREDENTIAL_PSW | docker login -u $registry_CREDENTIAL_USR --password-stdin'
      }
}
      stage('Deploy our image') {
            steps{
                  script {
                        dockerImage.push()
}
}
}
}
      stage('Cleaning up') {
            steps{
                  sh "docker rmi $registry:$BUILD_NUMBER"
}
}
      }
}


