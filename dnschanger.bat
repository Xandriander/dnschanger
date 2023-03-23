@echo off
title DNS Server Configuration

set shecan1_dns=178.22.122.100
set shecan2_dns=185.51.200.2

set electro1_dns=78.157.42.100
set electro2_dns=78.157.42.101

set radar1_dns=10.202.10.10
set radar2_dns=10.202.10.11


set color_title=0A
set color_choices=0B
set color_error=0C


color %color_title%
echo =================================
echo    DNS Server Configuration
echo =================================
echo.


color %color_choices%
echo Choose an option:
echo 1. ^(Shecan.ir^)
echo 2. ^(Electro^)
echo 3. ^(Radar.game^)
echo 4. ^(Show DNS^)
echo 5. ^(Remove DNS^)

color

set /p choice=Enter choice : 

if %choice%==1 (
	netsh interface ipv4 set dns name="Wi-Fi" source=static address=%shecan1_dns% validate=no
	netsh interface ipv4 add dns name="Wi-Fi" address=%shecan2_dns% index=2 validate=no
    echo DNS servers set to Shecan DNS.
	
) else if %choice%==2 (
	netsh interface ipv4 set dns name="Wi-Fi" source=static address=%electro1_dns% validate=no
	netsh interface ipv4 add dns name="Wi-Fi" address=%electro2_dns% index=2 validate=no
    echo DNS servers set to Electro DNS.
	
) else if %choice%==3 (
	netsh interface ipv4 set dns name="Wi-Fi" source=static address=%radar1_dns% validate=no
	netsh interface ipv4 add dns name="Wi-Fi" address=%radar2_dns% index=2 validate=no
    echo DNS servers set to Radar DNS.
	
) else if %choice%==4 (
	echo.
	echo Detailed DNS server configuration for Wi-Fi interface:
	netsh interface ipv4 show dns "Wi-Fi"

	pause
	
) else if %choice%==5 (
	netsh interface ip set dns name="Wi-Fi" source=dhcp
    echo DNS servers removed successfully.
	pause
) else (
    :: Set color for error message
    color %color_error%
    echo Invalid choice. Please try again.
    :: Reset color to default
    color
	
	pause
)


