node {
    def app

    stage('Clone repository') {
      

        checkout scm
    }

    stage('Build image') {
  
       app = docker.build("momo979/Jenkinstest")
    }

    stage('Test image') {
  

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        
        docker.withRegistry('https://registry.hub.docker.com', 'Dockerhub-token') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
