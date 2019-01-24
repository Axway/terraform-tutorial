## Working in teams - remote state

An S3 bucket is already created : [condor-terraform-tutorial]

We're going to tell terraform to store states in the bucket, this way several people can work on the same project

Work in pair with someone else. Choose a workspace name (e.g pair member's last name) that you will both share

The first pair member executes 

    terraform init
    terraform workspace new [name chosen]
    terraform plan
    terraform apply

Go to AWS console, locate and download the terraform state 
    
The second pair member executes the same commands and notices that no update is executed

Notice the content of .terraform folder - the terraform.tfstate in that folder does not contain the actual state but just a pointer

Execute

    terraform destroy
