# File Structure

```
└── Azure/                # Azure-specific Terraform configurations
    ├── main.tf           # Defines GCP infrastructure
    ├── variables.tf      # Variables for GCP resources
    ├── README.md         # AWS-specific instructions
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
        ├── monitoring/
        │   ├── monitoring.tf
        │   └── monitoring-vars.tf
        └── vpc/
            ├── vpc.tf
            ├── vpc-vars.tf
            └── vpc-output.tf  
```

#### 3. Azure Deployment

The Azure setup includes:

- **Virtual Network (VNet)**: Custom network with subnets.
- **Virtual Machines (VMs)**: Web and backend servers.
- **Azure SQL Database**: Managed database service.
- **Scale Sets**: For automatic scaling.
- **Network Security Groups (NSG)**: Secure access control.

#### Azure Deployment Steps

1. **Setup Azure CLI**
```sh
az login
az account set --subscription "<YOUR_SUBSCRIPTION_ID>"
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
