## Internal Network

In variables.tf replace 1.1.1.1 with your public IP address

Check the differences with the previous lesson
 
Try to quickly draw a network diagram by hand

Understand how key_name, vpc_security_group_ids & subnet_id are passed to dummy server

Deploy the update

    terraform init
    terraform workspace new [name chosen]
    terraform plan
    terraform apply 
 
Try to access dummy server with Putty

If you have the time, draw the network diagram on confluence with the Gliffy plugin using the AWS resources official icons
Here's sample network diagram : https://techweb.axway.com/confluence/pages/viewpage.action?pageId=132363052

Don't destroy the platform                       

