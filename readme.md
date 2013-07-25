### Network Booting Kit
This kit was created for the purpose of creating network booting environment on Scientific Flight computer for the ISS-CREAM (International Space Station - Cosmic Ray Energetics And Mass) Project.

This document will serve as a concise tutorial in setting up pxebooting environment using DHCP, TFTP and NFS.

By Sean Bae

----

NOTE

- We assume your host server uses Scientific Linux (or compatible subset of RedHat distribution).

- We assume that your host server and your client computer are connected through host-only network or Ethernet.

----

STEPS:

1. Install DHCP, TFTP, and NFS in your host server by entering a simple command on terminal `yum install dhcp tftp nfs` on your host server

2. Change your directory to `/etc` folder and replace your current dhcpd.conf file with the one inside this kit

3. Open the new (one from this kit) `dhcpd.conf` file and follow the commented instruction (written in the configuration document) to configure your DHCP server settings with your correct server addresses so that it would point to your pxelinux.0 file (which we set up in step 5)

4. Enable the TFTP server by modifying your `/etc/xinetd.d/tftp` file (set `disable=no` and `server_args=/tftpboot -s`)

5. Copy the `tftpboot` and `master` folder in this kit to your root directory

6. Modify the `/tftpboot/pxelinux.cfg/default` file so that NFS can point to the correct server. To do this, set `nfsroot` parameter to your ip address followed by the `/master/diskless/sl5/i386/cd` (there is an example written on the `default` file)

7. Finally start portmapper and NFS by running the `start` file in this package

8. Start up your client machine (SFC) and when you reach a Scientific Linux boot screen, type `sl5diskless` and press enter to complete the network booting process

----

TROUBLESHOOTING

- If for some reason the SFC cannot connect to DHCP or TFTP server, it might be that your server's firewall is blocking external connection by default. To allow SFC to network boot, type the command `iptables -F` (it will flush your firewall settings).

- If the server refuse to execute any of the steps above, you might not be logged in as root. If you do not have root account access, you can alternatively use the `sudo` command.

- If you cannot copy of modify some files, try to change permission settings of files by `chmod 777 FILENAME` to give permission to read/write/execute to everyone.

