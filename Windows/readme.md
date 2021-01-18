## Windows迁移
新环境

1. 安装 powershell core https://github.com/PowerShell/PowerShell/releases
2. 执行migrate.ps1

migrate.ps1迁移脚本
其中执行了install_scoop.ps1

前置条件是在在端口7890搭了梯子



| 文件              | 简介      | 备注                    |
| ----------------- | --------- | ----------------------- |
| migrate.ps1       | 迁移脚本  | 调用了install_scoop.ps1 |
| install_scoop.ps1 | scoop相关 | 安装了scoop和一些包     |
|  proxy.ps1        |代理相关   |  暂时用不了              |

