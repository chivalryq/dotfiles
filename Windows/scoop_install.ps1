#安装
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

#代理 
scoop config proxy 127.0.0.1:7890
#提供了sudo,ln等工具
scoop install psutils
