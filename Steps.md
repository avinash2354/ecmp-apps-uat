# ⚡ Step-by-Step Execution (Microservices CI/CD on EC2 with Jenkins + DockerHub + GitHub)
## 🧩 STEP 1: Launch EC2 (Ubuntu)

### Go to AWS Console → EC2 → Launch Instance
### Fill in:
### Name: MicroMart-CICD
### AMI: Ubuntu 22.04 LTS
### Instance Type: t2.micro (Free Tier)
### Storage: 10 GB
### Security Group → Add inbound rules:
```bash
22   SSH / EC2 Connect
80   HTTP
8080 Jenkins
3001 Auth service
3002 Product service
3003 Order service

```
### Launch instance
### Connect via EC2 Instance Connect (from AWS console).
---
## 🧩 STEP 2: Install Dependencies on EC2
```bash
# Update
sudo apt update

# Install Git + Docker
sudo apt install -y git docker.io
sudo usermod -aG docker ubuntu
newgrp docker

# Install Java + Jenkins
sudo apt install -y openjdk-11-jdk
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update
sudo apt install -y jenkins

# Start Jenkins
sudo systemctl start jenkins
sudo systemctl enable jenkins
```
---
## 🧩 STEP 3: Access Jenkins
### Browser → http://<EC2-PUBLIC-IP>:8080
### Get Jenkins initial password:
```bash
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
### Paste in Jenkins setup wizard.
### Choose Install Suggested Plugins.
---
## 🧩 STEP 4: Install Jenkins Plugins (If missed)
### Jenkins → Manage Jenkins → Plugins → Available:
### Docker Pipeline
### GitHub Integration
### Git Plugin
### Credentials Binding
### Blue Ocean (optional)
---
## 🧩 STEP 5: Create DockerHub Repositories

### Go to hub.docker.com
### Create 3 repositories:
### auth-service
### product-service
### order-service
### Your repo names will look like:
```bash
dockerhub_username/auth-service
dockerhub_username/product-service
dockerhub_username/order-service
```
## 🧩 STEP 6: Add Credentials to Jenkins

### Jenkins → Manage Jenkins → Credentials → Global → Add Credentials
### Add:
### GitHub Token
```bash
Kind: Username with password
ID: github-token
Username: <your GitHub username>
Password: <GitHub Personal Access Token>
```
### DockerHub
```bash
Kind: Secret text
ID: dockerhub-pass
Secret: <DockerHub Password or Token>
```
---
## 🧩 STEP 7: Clone Project on EC2 (Optional Check)
```bash
git clone https://github.com/tanvirmulla11/ecommerce-microservices.git
cd ecommerce-microservices
ls
```
### Ensure folders exist:
```bash
auth-service/
product-service/
order-service/
```
### And inside each → Jenkinsfile
---
## 🧩 STEP 8: Jenkinsfile Template
### Inside auth-service/Jenkinsfile (repeat for product-service & order-service by changing SERVICE_NAME):
auth-service/Jenkinsfile
product-service/Jenkinsfile
order-service/Jenkinsfile
```bash
pipeline {
    agent any

    environment {
        SERVICE_NAME = 'auth-service'   // change for product-service / order-service
        DOCKER_USERNAME = 'your-dockerhub-username'
        DOCKER_IMAGE = "${DOCKER_USERNAME}/${SERVICE_NAME}:${BUILD_NUMBER}"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', credentialsId: 'github-token', url: 'https://github.com/tanvirmulla11/ecommerce-microservices.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${DOCKER_IMAGE}", "./${SERVICE_NAME}")
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-pass', variable: 'DOCKER_PASS')]) {
                    sh 'echo $DOCKER_PASS | docker login -u your-dockerhub-username --password-stdin'
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }
    }
}
```
---
## 🧩 STEP 9: Create Jenkins Pipeline Jobs

### Jenkins → New Item → auth-service-pipeline

### Type: Pipeline

### Pipeline Config:

### Definition: Pipeline script from SCM

### SCM: Git

### Repo URL:
```bash
https://github.com/tanvirmulla11/ecommerce-microservices.git
```

### Credentials: github-token

### Branch: */main

### Script Path:
```bash
auth-service/Jenkinsfile
```

### Repeat for:

### product-service/Jenkinsfile

### order-service/Jenkinsfile
---
## 🧩 STEP 10: Run Pipelines

### Jenkins → Open each pipeline → Build Now

### Jenkins will:

### Clone repo

### Build Docker image

### Push image to DockerHub

### heck DockerHub → You’ll see:
```bash
your-dockerhub-username/auth-service:1
your-dockerhub-username/product-service:1
your-dockerhub-username/order-service:1
```
---
## 🧩 STEP 11: Run Containers on EC2
```bash
docker run -d -p 3001:3000 your-dockerhub-username/auth-service:1
docker run -d -p 3002:3000 your-dockerhub-username/product-service:1
docker run -d -p 3003:3000 your-dockerhub-username/order-service:1
```
---

## 🧩 STEP 12: Verify in Browser
```bash
http://<EC2-IP>:3001 → Auth Service

http://<EC2-IP>:3002 → Product Service

http://<EC2-IP>:3003 → Order Service
```
---
# ✅ Done → You now have end-to-end CI/CD for microservices with GitHub → Jenkins → DockerHub → EC2 deployment.
