pipeline{
    agent any
    stages{
        stage("Wait for other pipeline")
        {
            steps {
                // Trigger Pipeline A and wait for it to complete
                build job: 'example-voting-app-result', wait: true

                // Trigger Pipeline B and wait for it to complete
                build job: 'example-voting-app-vote', wait: true

                // Trigger Pipeline C and wait for it to complete
                build job: 'example-voting-app-worker', wait: true

                // Now, this pipeline will only proceed after Pipeline A, Pipeline B, and Pipeline C have completed
            }
        }
        stage("Kubeneters build"){
            steps{
                sh 'kubectl create -f k8s-specifications/'
            }
        }
    }
}