# Udagram Project
  ##### Author - Sumit Arora
Udagram project by Sumit Arora for Udacity Cloud DevOps Nanodegree program. 
This project intends to deploy a high availability web app using Cloud Formation.

## Problem - 
Your company is creating an Instagram clone called Udagram. Developers pushed the latest version of their code in a zip file located in a public S3 Bucket.
You have been tasked with deploying the application, along with the necessary supporting software into its matching infrastructure.
This needs to be done in an automated fashion so that the infrastructure can be discarded as soon as the testing team finishes their tests and gathers their results.

## Solution - 

### Diagram - 
![alt text](https://github.com/sumitarora02/sumit-udagram/blob/main/Udagram_Arch_SumitArora.jpeg?raw=true)


### Description - 
The project is divided into various modules to allow continuous integration while working in a team.
I have tried to perform all the steps using cloudformation including key pair generation.
Below are the details - 

1. The *utils* folder is the propeller for the project. It hosts bash scripts to create / destroy public and private keys. Along with that, it is also responsible of creating, updating and deleting cloudformation stacks.
2. The *iam* folder is responsible to deploy a stack with iam roles and policies for accessing the public S3 bucket.
3. The *network* folder would be deploying the vpc, subnets and other network components used in this project.
4. The *jumpbox* folder would be deploying the bastion host on the public subnets using elastic ip address.
5. The *server* foler is responsible to deploy a stack with all 4 private servers, Load balancers, Autoscaling and Cloud watch alarms.

### Instructions - 
Please follow the below steps to execute this project successfully.

##### Deployment - 
Execute the below scripts in the same order.

1. Clone the repository from Github (https://github.com/sumitarora02/sumit-udagram) into your local machine, or download the code directly from github master.
2. Execute the below to create public and private keys and upload to AWS.
- [x] ./utils/create-secure-key.sh
3. Execute the below to create iam stack with all the relevant roles and policies for accessing the public S3 bucket provided by Udacity.
- [x] ./utils/create-stack.sh iam-stack iam/iam-stack-template.yml iam/iam-parameters.json
4. Execute the below to create network stack with all network components.
- [x] ./utils/create-stack.sh network-stack network/network-stack-template.yml network/network-parameters.json
5. Execute the below to create jumpbox / bastion host stack, to be deployed on the public subnets.
- [x] ./utils/create-stack.sh jumpbox-stack jumpbox/jumpbox-stack-template.yml jumpbox/jumpbox-parameters.json
6. Execute the below to create server stack, to be deployed on private subnets.
- [x] ./utils/create-stack.sh server-stack server/server-stack-template.yml server/server-parameters.json

Access the website link from the output from the Load Balancer - 


##### Rollback - 
In case you wish to rollback the cloud formation stacks, you can do it one by one - all thanks to the in-built modularity.
Please follow the steps in same order.
- [x] ./utils/delete-stack.sh server-stack
- [x] ./utils/delete-stack.sh jumpbox-stack
- [x] ./utils/delete-stack.sh network-stack
- [x] ./utils/delete-stack.sh iam-stack
- [x] ./utils/delete-secure-key.sh

