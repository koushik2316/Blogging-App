# Blogging App

A production-ready full-stack blogging platform built with **Java (Spring Boot)**, containerized with **Docker**, and deployed on **AWS EKS** using **Terraform**. This project implements modern **DevSecOps** best practices, featuring automated CI/CD pipelines, security scanning, private artifact repositories, and full monitoring.

---

## 📖 Description

Blogging App allows users to create, edit, and manage blog posts with role-based authentication and authorization. The backend is developed in Java with Spring Boot, while the infrastructure runs on Kubernetes managed by AWS EKS. The entire environment is provisioned as code with Terraform, integrated with Jenkins pipelines for continuous integration and delivery.

---

## 🏗️ Tech Stack

| Layer           | Tools & Technologies                          |
|-----------------|----------------------------------------------|
| Backend         | Java, Spring Boot, Maven                      |
| Infrastructure  | Terraform, AWS EKS, VPC, IAM                  |
| CI/CD           | Jenkins, Nexus, SonarQube                     |
| Security        | Trivy (image scanning), Role-based access     |
| Containerization| Docker, Private Docker Registry (in-cluster)  |
| Orchestration   | Kubernetes (EKS)                              |
| Monitoring      | Prometheus, Grafana, Blackbox Exporter        |

---

## 🚀 Features

- 📝 Create, edit, and delete blog posts  
- 👤 User registration and login with authentication  
- 🔐 Role-based authorization (admin/user)  
- 🧼 Code quality checks with SonarQube  
- 🔍 Security scanning using Trivy  
- 📦 Artifact management with Nexus  
- 🐳 Image management in a private Docker registry  
- 🔄 Fully automated CI/CD pipeline with Jenkins  
- ☁️ Infrastructure provisioning using Terraform on AWS EKS  
- ☸️ Kubernetes-native deployment and scaling  
- 📈 Monitoring and alerting with Prometheus, Grafana, and Blackbox Exporter  

---

## 🛠️ Setup & Installation

### Prerequisites

- Java 17+ and Maven  
- Docker installed and running  
- AWS CLI configured with credentials  
- Terraform (v1.0+) installed  
- kubectl configured for your EKS cluster  
- Jenkins server (optional, if running CI/CD)  

### Infrastructure Provisioning

1. Clone the repository:

   ```bash
   git clone https://github.com/koushik2316/Blogging-App.git
   cd Blogging-App

2.  Navigate to the EKS Terraform directory:

   ```bash
   cd EKS_Terraform
   ```

3. Configure AWS credentials and update `terraform/variables.tf` with your region, key names, etc.

4. Initialize Terraform:

   ```bash  
    terraform init
    ```
5. Plan the infrastructure:
    ```bash
    terraform plan
    ```
6. Apply the configuration:
   ```bash
    terraform apply
    ```
This will create the EKS cluster, networking, IAM roles, and other infrastructure.

---

### Build and Push Docker Images
```
mvn clean package
docker build -t your-private-registry/blogging-app:latest .
docker push your-private-registry/blogging-app:latest
```

---

### Deploy to Kubernetes
```
kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml
```

---

### 🔄 CI/CD Pipeline
- Jenkinsfile defines stages for building, testing, scanning (Trivy), and deploying images.

- Automated triggers on Git commits.

- Artifacts published to Nexus repository.

- Container images pushed to the private Docker registry.

---

### 🔐 Security
- Role-based access control implemented at the application level.

- Image vulnerability scanning done by Trivy during the CI pipeline.

- Secrets managed securely within Kubernetes.

---

### 📊 Monitoring
- Prometheus collects metrics from app and cluster.

- Grafana dashboards visualize application and infrastructure health.

- Blackbox Exporter monitors endpoint availability.

---

## Dashboard Screenshots


 ![Image](screenshots/Screenshot%202025-08-10%20144526.png)

## Screenshot

 ![Image](screenshots/Screenshot%202025-08-10%20145027.png)