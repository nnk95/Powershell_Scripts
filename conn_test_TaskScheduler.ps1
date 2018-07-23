$pingtest10x = Test-Connection 10.36.9.1 -count 1 -quiet
$pingtest192x = Test-Connection 192.168.0.5 -count 1 -quiet
$pingtestvmx = Test-Connection 12.0.0.5 -count 1 -quiet

if(!$pingtest10x)
{
    Restart-NetAdapter -Name "10*"
    Write-EventLog -LogName NetworkRestartLogs -Source netrslog -Message "net 10x adapter restarted." -EventId 2 -EntryType Warning
}

if(!$pingtest192x)
{
    Restart-NetAdapter -Name "192*"
    Write-EventLog -LogName NetworkRestartLogs -Source netrslog -Message "net 192x adapter restarted." -EventId 2 -EntryType Warning
}

if(!$pingtestvmx)
{
    Restart-NetAdapter -Name "VM*"
    Write-EventLog -LogName NetworkRestartLogs -Source netrslog -Message "net VMx adapter restarted." -EventId 2 -EntryType Warning
}
elseif($pingtest10x,$pingtest192x,$pingtestvmx)
{
    Write-EventLog -LogName NetworkRestartLogs -Source netrslog -Message "No issues detected." -EventId 1 -EntryType Information
}