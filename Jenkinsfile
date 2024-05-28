pipeline {
    agent any

    stages {
        stage('Install Packages') {
            steps {
                script {
                    sh 'npm install'
                }
            }
        }

        stage('Run the App') {
            steps {
                script {
                    sh 'node index.js &'
                    sleep 5
                }
            }
        }

        

        stage('Cleanup') {
            steps {
                script {
                    sh 'pkill -f "node"'
                }
            }
        }
    }
}