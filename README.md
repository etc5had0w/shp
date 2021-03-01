# Shell Please 1.0 : Reverse Shell Code Generator

Shell Please is a tool made for generating reverse shell code in matter of nano-seconds.

Whenver we are performing penetration testing, we always need reverse shell code to get a reverse shell from target system in case of RCE. However, its annoying to go to different sites and copy the reverse shell code then edit it according to the current scenario. 

Shell Please will generate reverse shell code for more than 8 types such as php,bash,nc,python,golang,etc.

You can always execute one single command and get access to many shell codes, now you can just copy the code and get the damn reverse shell!

## How to install?

Copy paste these commands into your shell :

```
git clone https://github.com/etc5had0w/shp.git
cd shp/
chmod +x shp.sh
ln -s ${PWD}/shp.sh /usr/bin/shp
```

## How to Use? 
```
Usage: shp -i <IP> -p <PORT> [ OPTIONS FLAG ]

FLAG                            DESCRIPTION
-i    Specify IP Address where you want the reverse shell to spawn.
-p    Specify Port Number where you want the reverse shell to spawn.
-a    Display all types of reverse shell commands.
-l    Start a netcat listener on specified port.
-t    Specify type of reverse shell command you want.

Here is the complete list of -t parameters :
-t netcat
-t bash
-t python
-t php
-t perl
-t ruby
-t golang
-t powershell

 ## Example Usage:

To generate all types of reverse shell code :
shp -i 10.10.7.1 -p 2222 -a

To generate python reverse shell code :
shp -i 10.10.7.1 -p 2222 -t python
```
