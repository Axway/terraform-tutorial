## Servers Configuration - Part I

Check differences with previous lesson

In variables.tf replace 1.1.1.1 with your public IP address 

Deploy update and notice how the bastion is automatically recreated : a user data config change triggers the recreation of the server 
 
Access the bastion and notice the new command prompt

Open ``/var/log/cloud-init.log`` to see how the user data script deployment went 
(tip : always use set -xv in user data scripts) 

Don't destroy the platform
