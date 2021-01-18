#安装scoop
Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

#代理 
scoop config proxy 127.0.0.1:7890
#提供了sudo,ln等工具
scoop install psutils

#安装WT
scoop bucket add dorado https://github.com/h404bi/dorado
scoop install windows-terminal

#tools
scoop bucket add extras
scoop install typora
scoop install snipaste  # 截图工具
scoop install potplayer

# develop
scoop install vscode vim curl vscode  