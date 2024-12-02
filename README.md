# 🚀 AWS-Terraform-HA-infra
Deploy a Scalable and Highly Available Architecture on AWS with Terraform

## 🌟 Project Overview
The purpose of this project is to contribute to the community by making highly available and scalable infrastructure code available for everyone to use and learn from. Components used in this architecture are included in the AWS free tier.

![AWSsimplearch drawio](https://github.com/user-attachments/assets/b882b767-98ab-46be-85ce-2b1ea018e96d)


## 🏗️ Architecture Highlights
### Multi-AZ Deployment
With multiple Availability Zones, we can improve fault tolerance by distributing instances across zones. If one AZ experiences problems, the other AZ maintains service continuity.

### Auto Scaling Group (ASG)
ASG helps us to scale instances up to meet traffic demands or down when not in use, resulting in lower costs and better performance management. 

### Application Load Balancer (ELB)
The Application Load Balancer equaliy distributes the incoming traffic to healthy instances. This distribution can be across multiple AZs, contributing to high availability.

## 🛠️ Techincal Details
*  **VPC:**  Dividing the network into private and public subnets.
*  **EC2:**  Instances: Virtual machines that runs the desaired application.
*  **EFS:**  Storage: Commong storage for EC2s to access.
*  **ALB:**  Application Load Balancer for distributing the load
*  **NAT Instances:**  They are bridges between private subnets to the internet.
*  **Security Groups:**  Helps us to manage, restrict and secure our networks.

# ⚙️ Getting Started
### AWS Account
To be able to deploy your infrastructure to the AWS, [here](aws.amazon.com/resources/create-account/) you can find all the information to setup an account. I would also recommend that you visit the [AWS Free Tier](https://aws.amazon.com/free/) page to learn more about limits and how to avoid unexpected bills (setting a budget and regularly checking AWS Bills and Cost Management).

### AWS CLI
AWS CLI is a command line interface to control you AWS services. You can find offical documentation (here)[https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html] or simply to just install follow here:

This installation guid is for Linux. If you have another operating system, please refer to the link above.
```Bash
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
```
We download the AWS CLI installation file
```Bash
unzip -u awscliv2.zip
```
We extract the contents of the zip file (you can use any unzipping tool).

```Bash
sudo ./aws/install
```
And here we install the AWS CLI to our system.

Now to cconfirm it we can run:
```bash
aws --version
```
### Terraform
Official guide can be found [on this site](https://developer.hashicorp.com/terraform/install#linux). 
If you have a Debian based linux, you can also folow here:
```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
```
```bash
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
```
```bash
sudo apt update && sudo apt install terraform
```
To verify it
```bash
terraform --version
```

Finally we need to input our AWS credentials to Terraform. There are many ways to do this, but for simplicity here I will show doing it with environment variables:
```bash
export AWS_ACCESS_KEY_ID="my-access-key"
export AWS_SECRET_ACCESS_KEY="my-secret-key"
export AWS_REGION="us-west-2"
```
Please change the fields accordint to your credentials. You can find more information about how to generate access key on [here](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html).
