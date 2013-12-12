:::::::::::::::::::::::::::::::::::::::::::::::::::
:Checks a range of IP addresses then performs
:an action based on whether the system responded
:to a ping command. Note that if the system has
:a firewall set to ignore pings, it will appear
:to be not present. Set _t4 to the first 3 numbers
:of the IP address. This example will check
:157.23.59.1 through 157.23.59.128
:::::::::::::::::::::::::::::::::::::::::::::::::::
@echo off
setlocal enabledelayedexpansion
:Timeout for ping command in milliseconds
Set _t0=500
:start IP (last number)
Set _t1=1
:ending IP (last number)
Set _t2=64
Set _t4=172.20.10.
for /L %%I in (%_t1%,1,%_t2%) do set _t3=%%I & (ping %_t4%%%I -n 1 -w %_t0% >nul
) & call:_e!errorlevel!
echo All IPs tested
:::::::::::::::::::::::::::::::::::::::::::::::::::
:clear the temp variables that were used
:::::::::::::::::::::::::::::::::::::::::::::::::::
for /L %%I in (0,1,4) do set _t%%I=
goto:eof
:::::::::::::::::::::::::::::
:End of main
:::::::::::::::::::::::::::::
:Subroutines Below here
:::::::::::::::::::::::::::::::::::::::::::::::::::
:Enter code to execute if the IP address is present in this section
:::::::::::::::::::::::::::::::::::::::::::::::::::
:_e0
echo %_t4%%_t3% exists
nslookup %_t4%%_t3%
goto:eof
:::::::::::::::::::::::::::::::::::::::::::::::::::
:Enter code to execute if the IP address is not present in this section
:::::::::::::::::::::::::::::::::::::::::::::::::::
:_e1
Echo %_t4%%_t3% does not exist
goto:eof
:::::::::::::::::::::::::::::::::::::::::::::::::::
