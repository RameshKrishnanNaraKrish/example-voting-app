1. Provision infrastructure using terraform

         terraform init

         terraform plan

         terraform apply --auto-approve

2. SSH to created eC2 instance

          ssh -i "<.pem file> <user@ipaddress>

3. Validate jenkins is installed and up and running

          sudo systemctl status jenkins

   To stop jenkins service

         sudo systemctl stop jenkins

   To start jenkins service
   
        sudo systemctl start jenkins


4. Provide sudo permission to jenkins user

          sudo visudo

          jenkins ALL=(ALL) NOPASSWD: ALL

       save the file

5. Switch to Jenkins user

          sudo su - jenkins

6. Install Docker in Jenkins user

          for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
          # Add Docker's official GPG key:
          sudo apt-get update
          sudo apt-get install ca-certificates curl
          sudo install -m 0755 -d /etc/apt/keyrings
          sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/   keyrings/docker.asc
          sudo chmod a+r /etc/apt/keyrings/docker.asc

          # Add the repository to Apt sources:
          echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/  docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
       sudo apt-get update

       sudo apt-get install docker-ce docker-ce-cli containerd.io  docker-buildx-plugin docker-compose-plugin

7. Add docker user group

       sudo usermod -aG docker $USER

8. Restart the instance

9. Install eksctl

       # for ARM systems, set ARCH to: `arm64`, `armv6` or `armv7`
       ARCH=amd64
       PLATFORM=$(uname -s)_$ARCH

       curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/    eksctl_$PLATFORM.tar.gz"

       # (Optional) Verify checksum
       curl -sL "https://github.com/eksctl-io/eksctl/releases/latest/download/ eksctl_checksums.txt" | grep $PLATFORM | sha256sum --check

       tar -xzf eksctl_$PLATFORM.tar.gz -C /tmp && rm eksctl_$PLATFORM.tar.gz

       sudo mv /tmp/eksctl /usr/local/bin


10. Install kubectl

          curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/ bin/linux/amd64/kubectl
          chmod +x kubectl
          mkdir -p ~/.local/bin
          mv ./kubectl ~/.local/bin/kubectl

11. Install awscli

          sudo apt install awscli

12. Configure aws

          aws configure

13. Create eks cluster

             aws eks update-kubeconfig --region us-east-1 --name my-cluster
             eksctl create cluster --name my-cluster --region us-east-1 --nodes 2 --node-type t3.medium --managed

14. Access jenkins on port 8080 and follow the installation steps

15. Create an admin user for Jenkins

20. Create a job (Pipeline)
    Create a separate pipeline for each microservices
    for example : example-voting-app-result for result service
                  example-voting-app-vote for vote service
                  example-voting-app-worker for worker service
      

21. Update pipeline configuration

    Provide SCM - Githib repository URL (provide GitHub credentials if you are working with a private repository)
    Provide the path to the Jenkinsfile for each microservice (/result/Jenkinsfile, /vote/Jenkinsfile,/worker/Jenkinsfile)
    Specify the branch (for example: */main)

22. Login to the AWS management console

       Create ECR (Elastic Container Registry)

23. Update the Registry Push commands in the Jenkins file

24. Update the Registry image name with the tag in the k8s-specifications folder

          <imagename>:<tag>

25. Enable Webhooks in Github
    
       Navigate to repository
    
          Settings -> Webhooks -> Add webhook
          Payload URL - <Provide Jenkins URL> (for example: 127.0.0.0:8080/)
          Content type - application/json
          Which events would you like to trigger this webhook? - Send me everything.

26. Click on Build Now in Jenkins

27. Select the build and click on Pipeline Console (or) Console Output for the pipeline progress

28. Update the EKS security group inbound rules to accept traffic from ports 31000 and 30000 for result and vote respectively.
