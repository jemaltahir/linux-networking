# linux-networking
Advanced linux networking commands

A summary of the commands I've suggested as a cheat sheet:

1. **IP Address Configuration**
   
   Add IP Address:
   ```bash
   sudo ip addr add 192.168.1.100/24 dev eth0
   ```

   Remove IP Address:
   ```bash
   sudo ip addr del 192.168.1.100/24 dev eth0
   ```

   Show IP Address:
   ```bash
   ip addr show
   ```

2. **Broadcast Address Configuration**

   Set Broadcast Address:
   ```bash
   sudo ip addr add 192.168.1.100/24 brd 192.168.1.255 dev eth0
   ```

   Auto Set Broadcast Address:
   ```bash
   sudo ip addr add 192.168.1.100/24 brd + dev eth0
   ```

3. **Default Gateway Configuration**

   Add Default Gateway:
   ```bash
   sudo ip route add default via 192.168.1.1
   ```

   Remove Default Gateway:
   ```bash
   sudo ip route del default via 192.168.1.1
   ```

   Show Routing Table:
   ```bash
   ip route show
   ```

4. **Static Routes Configuration**

   Add Static Route:
   ```bash
   sudo ip route add 10.0.0.0/8 via 192.168.1.1
   ```

   Remove Static Route:
   ```bash
   sudo ip route del 10.0.0.0/8 via 192.168.1.1
   ```

5. **Testing Network Configuration**

   Ping:
   ```bash
   ping -c 4 192.168.1.1
   ```

   Traceroute:
   ```bash
   traceroute 10.0.0.1
   ```

   Curl:
   ```bash
   curl https://example.com
   ```


1. **Configuring Network Namespace**

   Network namespaces are isolated instances of the network stack, including routes, firewall rules, and network devices. 

   Create a network namespace:
   
   ```bash
   sudo ip netns add myns
   ```

   List network namespaces:
   
   ```bash
   sudo ip netns list
   ```

   Execute command in specific network namespace:
   
   ```bash
   sudo ip netns exec myns ip addr
   ```

   Delete a network namespace:

   ```bash
   sudo ip netns delete myns
   ```

2. **Managing Virtual Ethernet (veth) Devices**

   Veth devices come in pairs and they can be used to create a tunnel between network namespaces.

   Create a veth pair:

   ```bash
   sudo ip link add veth0 type veth peer name veth1
   ```

   Assign a veth device to a network namespace:

   ```bash
   sudo ip link set veth1 netns myns
   ```

3. **Configuring Bridge**

   A network bridge is a Link Layer device which forwards traffic between networks based on MAC addresses.

   Create a bridge:

   ```bash
   sudo brctl addbr mybridge
   ```

   Add a network interface to a bridge:

   ```bash
   sudo brctl addif mybridge eth0
   ```

   Display bridges and their interfaces:

   ```bash
   sudo brctl show
   ```

   Delete a bridge:

   ```bash
   sudo brctl delbr mybridge
   ```

4. **Configuring VLANs**

   Virtual LANs (VLANs) are a way to create logically separate networks on the same physical switch.

   Create a VLAN:

   ```bash
   sudo ip link add link eth0 name eth0.100 type vlan id 100
   ```

   Delete a VLAN:

   ```bash
   sudo ip link delete eth0.100
   ```

5. **Manipulating ARP Cache**

   ARP cache is a table that stores IP to MAC address mappings.

   Display the ARP cache:

   ```bash
   arp -n
   ```

   Add a static ARP entry:

   ```bash
   sudo arp -s 192.168.1.1 00:11:22:33:44:55
   ```

   Delete an ARP entry:

   ```bash
   sudo arp -d 192.168.1.1
   ```

Networking (neutron)¶

Create network

$ openstack network create NETWORK_NAME

Create a subnet

$ openstack subnet create --subnet-pool SUBNET --network NETWORK SUBNET_NAME
$ openstack subnet create --subnet-pool 10.0.0.0/29 --network net1 subnet1




Remember to replace `192.168.1.100`, `192.168.1.1`, `10.0.0.0/8`, `eth0`, and other example values with the actual values for your network configuration. Please note that some of these commands may require additional packages to be installed on your system. For instance, `brctl` is part of the `bridge-utils` package, and may not be installed by default on some systems. Additionally, these commands should be executed with caution, as misconfigurations can cause network issues.
