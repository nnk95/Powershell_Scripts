cls

"Starting Connection Test.."
" "

$pingtest10x = Test-Connection 10.36.9.1 -count 1 -quiet
$pingtest192x = Test-Connection 192.168.0.5 -count 1 -quiet
$pingtestvmx = Test-Connection 12.0.0.5 -count 1 -quiet

if(!$pingtest10x)
{
    "10.36.x network is unreachable. Now proceeding to restart network adapter."
    Restart-NetAdapter -Name "10*"
    " "
}
elseif($pingtest10x)
{
    "10.36.x network is reachable."
    " "
}

if(!$pingtest192x)
{
    "192.168.0.x network is unreachable. Now proceeding to restart network adapter."
    Restart-NetAdapter -Name "192*"
    " "
}
elseif($pingtest192x)
{
    "192.168.0.x network is reachable."
    " "
}

if(!$pingtestvmx)
{
    "VMx network is unreachable. Proceeding to restart network adapter."
    Restart-NetAdapter -Name "VM*"
    " "
}
elseif($pingtestvmx)
{
    "VMx network is reachable."
    " "
}