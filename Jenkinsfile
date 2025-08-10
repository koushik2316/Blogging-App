pipeline {
    agent any
    
    tools{
        jdk 'jdk17'
        maven 'maven3'
    }
    
    environment{
        SCANNER_HOME= tool 'sonar-scanner'
    }

    stages {
        stage('Git Checkout') {
            steps {
                git branch: 'main', credentialsId: 'git-cred', url: 'https://github.com/koushik2316/FullStack-Blogging-App.git'
            }
        }
        stage('Compile') {
            steps {
                sh "mvn compile"
            }
        }
        stage('Test') {
            steps {
                sh "mvn test"
            }
        }
        stage('Trivy Files Scan') {
            steps {
                sh "trivy fs --format table -o fs.html ."
            }
        }
        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('sonar-server') {
                sh '''$SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Blogging-app -Dsonar.projectKey=Blogging-app \
                      -Dsonar.java.binaries=target ''' 
                }
            }
        }
        stage('Build') {
            steps {
                sh "mvn package"
            }
        }
        
        stage('Publish Artifacts') {
            steps {
                withMaven(globalMavenSettingsConfig: 'maven-settings', jdk: 'jdk17', maven: 'maven3', mavenSettingsConfig: '', traceability: true) {
                    sh "mvn clean deploy"
                }
            }
        }
        
        stage('Docker Build & Tag') {
            steps {
                script{
                withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                sh "docker build -t koushikn23/bloggingapp:latest ."
                    }
                }    
            }
        }
        
        stage('Trivy Image Scan') {
            steps {
                sh "trivy image --format table -o image.html koushikn23/bloggingapp:latest"
            }
        }
        stage('Docker Push Image') {
            steps {
                script{
                withDockerRegistry(credentialsId: 'docker-cred', toolName: 'docker') {
                sh "docker push koushikn23/bloggingapp:latest"
                    }
                }    
            }
        }
        stage('Deploy on Kubernetes') {
            steps {
                withKubeConfig(caCertificate: '', clusterName: 'my-eks-cluster', contextName: '', credentialsId: 'k8-cred', namespace: 'webapps', restrictKubeConfigAccess: false, serverUrl: 'https://86ABFBA04819DC254CDC3475FE8D8E17.gr7.ap-south-1.eks.amazonaws.com') {
                    sh "kubectl apply -f deployment-service.yml"
                    sleep 20
                  }
            }
        }
        stage('Verify on Deployment') {
            steps {
                withKubeConfig(caCertificate: '', clusterName: 'my-eks-cluster', contextName: '', credentialsId: 'k8-cred', namespace: 'webapps', restrictKubeConfigAccess: false, serverUrl: 'https://86ABFBA04819DC254CDC3475FE8D8E17.gr7.ap-south-1.eks.amazonaws.com') {
                    sh "kubectl get pods -n webapps"
                    sh "kubectl get svc -n webapps"
                  }
            }
        }
        
    }
}
