pipeline {

    agent any

    stages {

        stage("build") {
            steps {
               echo 'building the application' 
               sh 'chmod 777 /var/run/docker.sock'
               sh ' docker build -t test .'

            }
        }
        stage("Test") {
            steps {
               echo 'Testing the application' 
                
            }
        }
        stage("Deploy") {
            steps {
               echo 'Deploying the application' 
                
            }
        }
    }
}