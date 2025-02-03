# File Structure

```
└──GCP/                                     # GCP-specific Terraform configurations
    ├── main.tf                             # Defines GCP infrastructure
    ├── variables.tf                        # Variables for GCP resources
    ├── README.md                           # AWS-specific instructions
    └── modules/        
        ├── database/
        │   ├── database.tf
        │   └── db-vars.tf
        ├── lb/
        │   ├── lb.tf
        │   └── lb-vars.tf
        ├── instance-template/
        │   ├── instance-template.tf
        │   ├── it-vars.tf
        │   ├── it-output.tf
        │   └── scripts/
        │       └── startup.sh
        ├── microservice-instance/
        │   ├── microservices-instance.tf
        │   ├── ms-vars.tf
        │   └── ms-output.tf  
        └── vpc/
            ├── vpc.tf
            ├── vpc-vars.tf
            └── vpc-output.tf
```

#### 2. GCP Deployment
The GCP setup includes:
- **VPC:** Custom network with subnets.
- **Compute Instances:** Web and backend servers.
- **Cloud SQL:** Managed database service.
- **Instance Groups:** For automatic scaling.
- **Firewall Rules:** Secure access control.

#### GCP Deployment Steps
1. **Setup GCP CLI**
   ```bash
   gcloud auth login
   gcloud config set project <YOUR_PROJECT_ID>
   ```
2. **Initialize Terraform**
   ```bash
   cd GCP/
   terraform init
   ```
3. **Plan and Apply**
   ```bash
   terraform plan
   terraform apply
   ```
