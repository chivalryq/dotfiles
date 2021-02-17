#todo 把这里改成读取用户名
./scoop_install.ps1

$dotfileDir=$Home+"\repo\dotfiles"

#添加硬连接
#ideavim设置
sudo ln  $dotfileDir"\.ideavimrc" $Home"\.ideavimrc"

#WindowsTerminal 设置
Remove-Item $Home"\AppData\Local\Microsoft\Windows Terminal\settings.json"
sudo ln $dotfileDir"\Windows\settings.json" $Home"\AppData\Local\Microsoft\Windows Terminal\settings.json"

#posh7 core profile
Write-Output "Import-Module posh-git `r`n
Import-Module oh-my-posh `r`n
Set-Theme Agnoster`r`n" > $PROFILE
