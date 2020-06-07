# terraform_aws
Project to provision machines on AWS with Terraform

This project and the scripts within utilise a credentials file (`.tfvars`) which contain both the AWS Access and AWS Secret Keys. 

For example purposes, the machines are provisioned as T2 Micro's, though these can be changed to match your needs within each `instance.tf` file.

Versions Used:

* Terraform > v0.12
* AWS Provider Plugin > v2.65.0
