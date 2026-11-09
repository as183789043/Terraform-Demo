# 🚀 Terraform Self-Learning Demo

> A personal collection of hands-on demo projects and practice files created while studying Terraform via Udemy courses.

---

## 📖 About This Repository
This repository documents my hands-on learning journey with **HashiCorp Terraform**. It contains various practical configurations and infrastructure-as-code (IaC) demos, progressing from cloud storage management, customized multi-region VPC networking, to Compute Engine virtual machines.

---

## 🎯 Lab Targets & Structure

```text
Terraform-Demo/
│
├── Lab1/              # Multi-region Cloud Storage with lifecycle
├── Lab1-1/            # Single-region Cloud Storage with protection & lifecycle
├── Lab2/              # Custom VPC with 2 subnets (JP & SG) and firewall rules
├── Lab2-1/            # Advanced custom VPC with 4 subnets (2 JP, 1 HK, 1 SG)
├── Lab3/              # Google Compute Engine (Ubuntu 24.04, e2-micro, free tier eligible)
├── Lab3-1/            # GCE with persistent disk (200GB), startup script & Nginx
├── Lab4/              # Google Cloud Functions (v2) with Python & Public Access
└── README.md
```

---

| Lab ID | Project Name | Backup / Architecture Type | Core Setup & Network Details | Security & Lifecycle Policy |
| :---: | :--- | :--- | :--- | :--- |
| **Lab 1** | **Cloud Storage** | Multi-Region Backup | • Create a multi-region redundant Cloud Storage Bucket | • Uniform Bucket-Level Access<br>• Block Public Access<br>• Automatic deletion after **90 days** |
| **Lab 1-1** | **Cloud Storage** | Single-Region Backup | • Create a single-region redundant Cloud Storage Bucket | • Strict private access settings<br>• Resource protection rules within **30 days**<br>• Automatic deletion after **90 days** |
| **Lab 2** | **Custom VPC** | Basic Custom VPC | • Create a custom VPC<br>• 2 subnets (`jp`, `sg`) | • Inbound firewall ports allowed:<br>  `22 (SSH)`, `80 (HTTP)`, `443 (HTTPS)` |
| **Lab 2-1** | **Custom VPC** | Advanced Custom VPC | • Create an advanced custom VPC<br>• 4 subnets (`2 x jp`, `1 x hk`, `1 x sg`) | • Inbound firewall ports allowed:<br>  `22 (SSH)`, `443 (HTTPS)`, `3389 (RDP)` |
| **Lab 3** | **Compute Engine** | Basic GCE Instance | • Create an Ubuntu 24.04 `e2-micro` VM<br>• Use default network<br>• Located in free tier region (`us-west1`, `us-central1`, or `us-east1`) | • Inbound firewall ports allowed:<br>  `22 (SSH)` |
| **Lab 3-1** | **Compute Engine** | Advanced GCE with Nginx | • Create an Ubuntu 24.04 `e2-micro` VM<br>• Attach a 200GB regional persistent disk<br>• Startup script to install & run Nginx | • Inbound firewall ports allowed:<br>  `22 (SSH)`, `80 (HTTP)`, `443 (HTTPS)` |
| **Lab 4** | **Cloud Functions** | GCF v2 Deployment | • Deploy pre-created Hello World (Python)<br>• Zip source code from directory<br>• Enable required APIs (Cloud Resource Manager API manual start required)<br>• Create Cloud Function & upload code for testing | • Allow public access (`allUsers`) |
