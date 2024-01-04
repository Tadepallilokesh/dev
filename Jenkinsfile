pipeline {
    agent any
    stages {
        stage ("image build"){
            steps {
                sh "docker build -t flask-app ."
                sh "docker images |grep flask-app"
            }
        }
        stage ("running container from image"){
            steps {
                sh "docker run -dit --name web03 flask-app"
                sh "docker ps "
                sh "docker logs web03"
            }
        }
    }
}
