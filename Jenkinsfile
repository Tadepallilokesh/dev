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
                sh "docker run -dit --name web04 -p 5001:5000 flask-app"
                sh "docker ps "
                sh "docker logs web04"
            }
        }
    }
}
