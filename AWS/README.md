# File Structure

```
└── AWS/                        # AWS-specific Terraform configurations
    ├── main.tf                 # Defines AWS infrastructure
    ├── main-variables.tf       # Variables for AWS resources
    ├── README.md         # AWS-specific instructions
    └── modules/        
        ├── database/
        │   ├── database.tf
        │   └── db-vars.tf
        ├── lb/
        │   ├── lb.tf
        │   └── lb-vars.tf  
        ├── microservice-instance/
        │   ├── microservices-instance.tf
        │   ├── ms-vars.tf
        │   └── ms-output.tf  
        └── vpc/
            ├── vpc.tf
            ├── vpc-vars.tf
            └── vpc-output.tf 
```


#### AWS Deployment Steps
1. **Setup AWS CLI**
   ```bash
   aws configure
   ```
2. **Initialize Terraform**
   ```bash
   cd AWS/
   terraform init
   ```
3. **Plan and Apply**
   ```bash
   terraform plan
   terraform apply
   ```
