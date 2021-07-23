pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    mkdocsImage = docker.build("hmeen/mkdocs", "-f ./Dockerfile ./")
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    mkdocsImage.withRun(""){ c->
                        sh './mkdockerize.sh $PWD/testproject'
                        sh 'curl localhost:8000'
                    }
                }
            }
        }
    }
}
