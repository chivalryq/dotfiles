#todo 把这里改成读取用户名
./scoop_install.ps1
$User="C:\Users\qiaozp"
#添加硬连接
 sudo ln  $User"\repo\dotfiles\.ideavimrc" $User"\.ideavimrc"