$pingtest10x = Test-Connection 10.36.9.1 -count 1 -quiet
$pingtest192x = Test-Connection 192.168.0.5 -count 1 -quiet
$pingtestvmx = Test-Connection 12.0.0.5 -count 1 -quiet

if(!$pingtest10x)
{
    Restart-NetAdapter -Name "10*"
}

if(!$pingtest192x)
{
    Restart-NetAdapter -Name "192*"
}

if(!$pingtestvmx)
{
    Restart-NetAdapter -Name "VM*"
}