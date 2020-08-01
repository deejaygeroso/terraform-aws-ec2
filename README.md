# Terraform AWS EC2 Module

This is a terraform module that allows you to provision AWS VPC and EC2 instance.  
Ec2 instance is using ubuntu-trusty as its default OS.

## Getting Started

1. Install `terraform cli` on your local machine.
2. Install `aws cli` on your local machine.
3. Run command `aws configure` to configure aws credentials on your local machine.
4. Clone this repository.
5. Go to `terraform-aws-ec2/stage` or `terraform-aws-ec2/prod`.
6. Create RSA Key Pair. (Instructions can be found bellow)
7. Make sure you have the right variables needed on `terraform.tfvars` file. (See terraform variables table).
8. Run command `terraform init`.
9. Check if everything is setup correctly by running command: `terraform plan`.
10. Run command `terraform deploy`.

## Terraform Variables

Tip: You can add `terraform.tfvars` to `.gitignore` file, if you choose to add some credentials that does not need to be publicly available.
| Variables | Description | Default Values |
| :---------- | :----------- | :-------------: |
| AWS_REGION | A seperate geographic area that consist of multiple isolated availability zones | us-east-1
| CIDR | Docker configuration for stage and prod | 10.0.0.0/16 |
| ENV | Project environment: dev, stage or prod | stage |
| INSTANCE_TYPE | EC2 instance type | t2.micro |
| PRIVATE_SUBNETS | Private CIDR blocks for your availabilty zones | 10.0.101.0/24,  10.0.102.0/24,  10.0.103.0/24 |
| PUBLIC_SUBNETS | Public CIDR blocks for your availabilty zones | 10.0.1.0/24,  10.0.2.0/24,  10.0.3.0/24 |
| RSA_KEY_FILENAME | Filename of RSA key | mykey |

## Add RSA Key Pair

Execute command `ssh-keygen -f mykey` inside the director of either `/stage` or `/prod`.  
This will create two files: `mykey` and `mykey.pub`.  
If you want to modify the filename, just update the value of `RSA_KEY_FILENAME` on the `terraform.tfvars` file

## Project Files and Directory Structure

```
- terraform-aws-ec2
    - modules
        - instances
            - main.tf
            - variables.tf
            - versions.tf
        - vpc
            - main.tf
            - outputs.tf
            - variables.tf
            - versions.tf
    - prod
        - main.tf
        - provider.tf
        - terraform.tfvars
        - variables.tf
        - versions.tf
    - stage
        - main.tf
        - provider.tf
        - terraform.tfvars
        - variables.tf
        - versions.tf
```
