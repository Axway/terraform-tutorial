## Meeting with Terraform

From a shell prompt, execute :

    terraform init
    terraform plan
    terraform apply

Notice the output ``instance_id`` value

Open terraform.tfstate

Check all the attributes of your instance : they are the actual deployed attributes 

Check the content of .gitignore at root of project : we don't want to commit files created by terraform

Go to AWS console and find your instance using its id

Manually change a tag of the instance from the AWS console ( e.g project=terraform tutorial )

Execute

    terraform plan

Note that the tag will be removed 

    terraform apply
    
Note that the tag was removed

Browse to terraform documentation and try to locate help page for aws_instance resource (do not mix with aws_instance data source)

Add the tag using the code

Execute

    terraform plan
    terraform apply

Notice that the tag was successfully created

Execute

    terraform destroy
    
