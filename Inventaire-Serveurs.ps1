New-Item -ItemType Directory -Path C:\Inventaire -Force | Out-Null 
$filtre   = 'OperatingSystem -like "*Server*"' 
$serveurs = Get-ADComputer -Filter $filtre -Properties OperatingSystem, LastLogonDate 
$limite = (Get-Date).AddDays(-90)
$inactifs = Get-ADComputer -Filter * -Properties OperatingSystem, LastLogonDate |
    Where-Object { -not $_.LastLogonDate -or $_.LastLogonDate -lt $limite } |
    Select-Object Name, OperatingSystem, LastLogonDate, Enabled
$inventaire = foreach ($s in $serveurs) { 
$os = Get-CimInstance Win32_OperatingSystem -ComputerName $s.Name -ErrorAction SilentlyContinue 
[PSCustomObject]@{ 
Nom          = $s.Name 
Systeme      = $s.OperatingSystem 
Version      = $os.Version 
DernierBoot  = $os.LastBootUpTime 
DerniereConn = $s.LastLogonDate 
} 
} 
$inventaire | Export-Csv C:\Inventaire\serveurs.csv -NoTypeInformation -Encoding UTF8 
$inactifs | Export-Csv C:\Inventaire\ordinateurs-inactifs.csv -NoTypeInformation -Encoding UTF8
