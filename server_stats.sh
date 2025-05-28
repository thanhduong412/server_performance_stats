#!/bin/sh
# Total CPU usage
echo [INFO] Total CPU Usage:
top -bn1 | grep "Cpu(s)"
# Total memory usage (Free vs Used including percentage)
echo --------------------
echo [INFO] Total Memory Usage:
free -m | awk 'NR==2{printf"%sMB / %s MB (%.2f%%)\n", $3, $2, $3*100/$2}'
# Total disk usage (Free vs Used including percentage)
echo --------------------
echo [INFO] Total Disk Usage:
df -BM --total | awk '/total/ {printf "%s / %s (%s/ used)\n", $3, $2, $5}'
# Top 5 processes by CPU usage
echo --------------------
echo [INFO] Top 5 Processes by CPU Usage:
ps =eo pid,comm,$cpu --sort=-%cpu | head -n 6
# Top 5 processes by memory usage
echo --------------------
echo [INFO] Top 5 Processes by Memory Usage:
ps =eo pid,comm,$mem --sort=-%mem | head -n 6
# OS version
echo --------------------
echo [INFO] OS Version:
cat /etc/os-release | grep "^PRETTY_NAME"
# Uptime
echo --------------------
echo [INFO] Uptime:
uptime -p
