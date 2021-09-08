$dir=$env:systemroot+"\servicing\Packages\"
$components=Get-ChildItem $dir | where fullname -like "*Hyper-V*.mum" | select fullname
foreach ($component in $components.fullname){
  dism /online /norestart /add-package:$component
  }
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All