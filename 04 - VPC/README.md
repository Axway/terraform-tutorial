## VPC

In variables.tf replace 1.1.1.1 with your public IP address 

Deploy

    terraform init
    terraform workspace new [name chosen]
    terraform plan
    terraform apply

Understand vpc.tf, use terraform docs if needed

Notice AWS instance modifications

Deploy and try to connect to your instance with your favorite SSH client - the private key to use is available in the project in folder ssh-private-key

Don't destroy the platform
