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
