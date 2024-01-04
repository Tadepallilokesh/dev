pipeline {
    agent any
    stages {
        stage ("image build"){
            steps {
                sh "sudo docker build -t flask-app ."
                sh "sudo docker images |grep flask-app"
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
