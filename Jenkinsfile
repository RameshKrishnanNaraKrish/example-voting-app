pipeline {
    agent any

    stages {
        stage("Checkout From Git"){
            steps{
                git branch: 'main', url: 'https://github.com/RameshKrishnanNaraKrish/example-voting-app'
            }
        }
        stage("Result"){
            when {
                changeset "**/result/**"
            }
            steps{
                dir('result'){
                    // Build the Docker image
                    sh 'docker build -t result .'
                }
                dir('result'){
                    script {
                        sh 'aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/l1b1a8r4'
                        sh 'docker tag result:latest public.ecr.aws/l1b1a8r4/voting-app-result:latest'
                        sh 'docker push public.ecr.aws/l1b1a8r4/voting-app-result:latest'
                    }
                }
            }
        }
        stage("Vote"){
            when {
                changeset "**/vote/**"
            }
            steps{
                dir('vote'){
                    // Build the Docker image
                    sh 'docker build -t vote .'
                }
                dir('vote'){
                    script {
                        sh 'aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/l1b1a8r4'
                        sh 'docker tag vote:latest public.ecr.aws/l1b1a8r4/voting-app-vote:latest'
                        sh 'docker push public.ecr.aws/l1b1a8r4/voting-app-vote:latest'
                    }
                }
            }
        }
        stage("Worker"){
            when {
                changeset "**/worker/**"
            }
            steps{
                dir('worker'){
                    // Build the Docker image
                    sh 'docker build -t worker .'
                }
                dir('worker'){
                    script {
                        sh 'aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws/l1b1a8r4'
                        sh 'docker tag worker:latest public.ecr.aws/l1b1a8r4/voting-app-worker:latest'
                        sh 'docker push public.ecr.aws/l1b1a8r4/voting-app-worker:latest'
                    }
                }
            }
        }
    }
}