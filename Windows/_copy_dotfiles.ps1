$dotfileDir=$Home+"\repo\dotfiles"
if (Test-Path $Home"\.vimrc"){
    Remove-Item $Home"\.vimrc"
}
if (Test-Path $Home"\.ideavimrc"){
    Remove-Item $Home"\.ideavimrc"
}
sudo ln  $dotfileDir"\.ideavimrc" $Home"\.ideavimrc"
sudo ln  $dotfileDir"\.vimrc" $Home"\.vimrc"