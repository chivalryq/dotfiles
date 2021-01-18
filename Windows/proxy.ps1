Function Set-InternetProxy
{
    [CmdletBinding()]
    Param(
         
        [Parameter(Mandatory=$True,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
        [String[]]$Proxy,
 
        [Parameter(Mandatory=$False,ValueFromPipeline=$true,ValueFromPipelineByPropertyName=$true)]
        [AllowEmptyString()]
        [String[]]$acs
                 
    )
 
    Begin
    {
 
            $regKey="HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
         
    }
     
    Process
    {
         
        Set-ItemProperty -path $regKey ProxyEnable -value 1
 
        Set-ItemProperty -path $regKey ProxyServer -value $proxy
                             
        if($acs) 
        {            
             
                 Set-ItemProperty -path $regKey AutoConfigURL -Value $acs         
        }
 
    } 
     
    End
    {
 
        Write-Output "Proxy is now enabled"
 
        Write-Output "Proxy Server : $proxy"
 
        if ($acs)
        {
             
            Write-Output "Automatic Configuration Script : $acs"
 
        }
        else
        {
             
            Write-Output "Automatic Configuration Script : Not Defined"
 
        }
    }
}
 
 

Function Disable-InternetProxy
{
  Begin
    {
 
            $regKey="HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
         
    }
     
    Process
    {
         
        Set-ItemProperty -path $regKey ProxyEnable -value 0 -ErrorAction Stop
 
        Set-ItemProperty -path $regKey ProxyServer -value "" -ErrorAction Stop
                             
        Set-ItemProperty -path $regKey AutoConfigURL -Value "" -ErrorAction Stop          
        
    } 
     
    End
    {
 
        Write-Output "Proxy is now Disabled"
 
               
    }
 
}
 
# Disable-InternetProxy
#CFW的默认配置
Set-InternetProxy -proxy "127.0.0.1:7890"

#暂时不可用