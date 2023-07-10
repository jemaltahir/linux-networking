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

Remember to replace `192.168.1.100`, `192.168.1.1`, `10.0.0.0/8`, `eth0`, and other example values with the actual values for your network configuration.
