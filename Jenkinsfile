pipeline {
    agent any
        environment {
                PROJECT_ID = 'office-411914'
                CLUSTER_NAME = 'cluster-1'
                LOCATION = 'us-central1'
                CREDENTIALS_ID = 'kubernetes'
        }

    stages {
           
            stage('Build Docker Image') {
                    steps {
                            sh 'whoami'
                            script {
                                    myimage = docker.build("lokeshtadepalli267/flask:${env.BUILD_ID}")
                            }
                    }
            }

            stage("Push Docker Image") {
                    steps {
                            script {
                                    echo "Push Docker Image"
                                    withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
                                        sh "docker login -u lokeshtadepalli267 -p ${dockerhub}"
                                        sh "docker push lokeshtadepalli267/flask:${env.BUILD_ID}"
                                    }
                            }
                    }
            }

            stage('Deploy to K8s') {
                    steps{
                            echo "Deployment started ..."
                            
                          
                                sh "sed -i 's/tagversion/${env.BUILD_ID}/g' deployment.yaml"
                           
                                echo "Start deployment of deployment.yaml"
                                step([$class: 'KubernetesEngineBuilder', projectId: env.PROJECT_ID, clusterName: env.CLUSTER_NAME, location: env.LOCATION, manifestPattern: 'deployment.yaml', credentialsId: env.CREDENTIALS_ID, verifyDeployments: true])
                            echo "Deployment Finished ..."
                    }
            }
    }
}
