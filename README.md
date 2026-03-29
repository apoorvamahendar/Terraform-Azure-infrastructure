# Terraform Azure Infrastructure

Automated Azure infrastructure provisioning using Terraform modules.

## What it Deploys

- **Virtual Network** with 2 subnets
- **2 Linux VMs** (Ubuntu 22.04) — `web1` and `web2`
- **Standard Load Balancer** — distributes HTTP traffic on port 80
- **Network Security Group** — allows SSH (22) and HTTP (80)
- **Blob Storage** — Azure storage account with container

## Project Structure

```
├── main.tf               # Root module — calls all modules
├── variables.tf          # Input variable declarations
├── outputs.tf            # Output values
├── provider.tf           # Azure provider config
├── backend.tf            # Remote backend config
└── modules/
    ├── vnet/             # Virtual Network & Subnets
    ├── vm/               # Linux Virtual Machine
    ├── load_balancer/    # Load Balancer & health probe
    ├── security_group/   # Network Security Group
    └── storage/          # Storage Account & Container
```

## Remote State

Terraform state is stored remotely in Azure Blob Storage — keeping state consistent and shared across environments.

## Usage

```bash
# Initialize with remote backend
terraform init -backend-config=backend.hcl

# Preview changes
terraform plan

# Apply infrastructure
terraform apply

# Destroy infrastructure
terraform destroy
```
