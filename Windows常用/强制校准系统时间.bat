echo 正在通过时间服务器同步时间，请勿关闭窗口...
@echo off
chcp 65001 >nul
:: echo 正在通过时间服务器同步时间...

:: 停止Windows Time服务
net stop w32time >nul 2>&1

:: 配置时间服务器（以阿里云NTP服务器为例）
w32tm /config /syncfromflags:manual /manualpeerlist:"ntp.aliyun.com" >nul

:: 重新启动时间服务
net start w32time >nul 2>&1

:: 强制立即同步
w32tm /resync /force

:: echo 时间同步完成！
:: echo 当前系统时间：%date% %time%
:: pause