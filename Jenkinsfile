pipeline {
    agent any

    stages {
        stage('Install Packages') {
            steps {
                nodejs('Node 22') {
                    echo "Installing Packages......"
                    sh 'npm install'
                }
            }
        }
        
    }
}