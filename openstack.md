Some common OpenStack network operations using the `openstack` command-line client. These commands will require the OpenStack command-line client to be installed and properly authenticated.

1. **Managing Networks**

   Create a network:

   ```bash
   openstack network create mynetwork
   ```

   List networks:

   ```bash
   openstack network list
   ```

   Delete a network:

   ```bash
   openstack network delete mynetwork
   ```

2. **Managing Subnets**

   Create a subnet:

   ```bash
   openstack subnet create --network mynetwork --subnet-range 192.168.1.0/24 mysubnet
   ```

   List subnets:

   ```bash
   openstack subnet list
   ```

   Delete a subnet:

   ```bash
   openstack subnet delete mysubnet
   ```

3. **Managing Routers**

   Create a router:

   ```bash
   openstack router create myrouter
   ```

   Add a router interface to a subnet:

   ```bash
   openstack router add subnet myrouter mysubnet
   ```

   List routers:

   ```bash
   openstack router list
   ```

   Delete a router:

   ```bash
   openstack router delete myrouter
   ```

4. **Managing Floating IPs**

   Create a floating IP:

   ```bash
   openstack floating ip create public-net
   ```

   List floating IPs:

   ```bash
   openstack floating ip list
   ```

   Associate a floating IP with an instance:

   ```bash
   openstack server add floating ip myserver 203.0.113.0
   ```

   Delete a floating IP:

   ```bash
   openstack floating ip delete 203.0.113.0
   ```

5. **Managing Security Groups**

   Create a security group:

   ```bash
   openstack security group create mysecgroup
   ```

   List security groups:

   ```bash
   openstack security group list
   ```

   Add a rule to a security group:

   ```bash
   openstack security group rule create --proto tcp --dst-port 22:22 --remote-ip 0.0.0.0/0 mysecgroup
   ```

   Delete a security group:

   ```bash
   openstack security group delete mysecgroup
   ```


1. **Managing Ports**

   Create a port:

   ```bash
   openstack port create --network mynetwork myport
   ```

   List ports:

   ```bash
   openstack port list
   ```

   Delete a port:

   ```bash
   openstack port delete myport
   ```

2. **Assigning a Floating IP to a Port**

   First, create a floating IP:

   ```bash
   openstack floating ip create public-net
   ```

   The command's output will include the floating IP's ID. Next, set the floating IP to the port:

   ```bash
   openstack floating ip set --port myport <floatingip-id>
   ```

   Remember to replace `<floatingip-id>` with the actual ID of your floating IP.

3. **Adding an Interface to a Router**

   Add a router interface to a subnet:

   ```bash
   openstack router add subnet myrouter mysubnet
   ```

   Add a router interface to a port:

   ```bash
   openstack router add port myrouter myport
   ```

4. **Security Groups and Rules**

   To create a security group:

   ```bash
   openstack security group create mysecgroup
   ```

   Add a rule to a security group to allow inbound SSH (for example):

   ```bash
   openstack security group rule create --proto tcp --dst-port 22:22 --remote-ip 0.0.0.0/0 mysecgroup
   ```

5. **Creating and Managing Network Trunks**

   Create a trunk:

   ```bash
   openstack network trunk create --parent-port myport mytrunk
   ```

   Add a subport to a trunk:

   ```bash
   openstack network trunk set --subport port=subport1,segmentation-type=vlan,segmentation-id=101 mytrunk
   ```

   List trunks:

   ```bash
   openstack network trunk list
   ```

   Delete a trunk:

   ```bash
   openstack network trunk delete mytrunk
   ```

