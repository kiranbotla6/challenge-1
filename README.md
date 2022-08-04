# challenge-1
Azure 3-tier environment that includes web,app,data base layer within an Azure VNET with required security.

Resources that are consumed by this environemnt:
Azure VNET and 3 subnets for each layer
One Azure Virtual machine per subnet- used windows VM
NSG is added at subnet level to restrict and allow the traffic
One MySQL database
One key valut to store the VM credentials as a secret.
All the resources are created under one resource group.
