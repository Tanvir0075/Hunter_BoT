#!/bin/bash
url=$1
figlet -f slant " Vill4!n'S Team"
echo "                        #| Every Villain is a Hero in his Own Mind |#"
echo "                        #| Vill4!n'S Team's Bug Hunting T00ls      |#"
echo "                        #| Script Name : Hunter BOT                |#"
echo "                        #| Coded by J4ck 5P4RR0w || Version: @1.0  |#"
echo ""
echo ""
if [ ! -d "$url" ];then
	mkdir $url
fi
if [ ! -d "$url/recon" ];then
	mkdir $url/recon
fi
if [ ! -d '$url/recon/sub' ];then
        mkdir $url/recon/sub
fi
if [ ! -d '$url/recon/dir' ];then
        mkdir $url/recon/dir
fi
if [ ! -d '$url/recon/prms' ];then
        mkdir $url/recon/prms
fi
echo "[+] Searching Subdomain On SUBLIST3R..... "
python3 Tools/Sublist3r/sublist3r.py -d $url -o $url/recon/sub/sub.txt
cat $url/recon/sub/sub.txt | grep $1 >> $url/recon/sub/sub_final.txt
rm $url/recon/sub/sub.txt
echo "[+] Searching Directory On DIRSEARCH..... "
python3 Tools/dirsearch/dirsearch.py --url-list $url/recon/sub/sub_final.txt -e html,php,jsp,asp,json --simple-report $url/recon/dir/dir1.txt
cat $url/recon/dir/dir1.txt | sort -u >> $url/recon/dir/dir.txt
rm $url/recon/dir/dir1.txt
echo "[+] Searching Parameter  On ARJUN....."
python3 Tools/Arjun/arjun.py --urls $url/recon/dir/dir.txt -f /Tools/Arjun/db/params.txt --get -o $url/recon/prms/prms1.txt
cat $url/recon/prms/prms1.txt | sort -u >> $url/recon/prms/prms.txt
rm $url/recon/prms/prms1.txt
echo ""
echo ""
echo "                        #| Thanks for Using M3                     |#"
echo "                        #| Special Thanks [+] MR Villain           |#"
echo "                        #| CopyRight © Vill4!n'S Team              |#"