@echo off
setlocal enabledelayedexpansion

:: 获取本机IP地址（多网卡版）
set "LOCAL_IP="
for /f "tokens=2 delims=:" %%a in ('ipconfig ^| findstr /R /C:"IPv4 地址"') do (
    set "TEMP_IP=%%a"
    set "TEMP_IP=!TEMP_IP:~1!"
    
    :: 排除特定IP段
    echo !TEMP_IP! | findstr /R /C:"^127\." /C:"^169\." /C:"^172\." >nul
    if errorlevel 1 (
        set "LOCAL_IP=!TEMP_IP!"
        goto :found_ip
    )
)

:found_ip
if not defined LOCAL_IP (
    set "LOCAL_IP=192.168.200.26"  :: 手动指定默认IP
)

:: 获取文件夹路径
set "FOLDER_PATH=%~1"

:: 使用Python生成文件夹共享二维码
python -c "import qrcode, os; qr = qrcode.QRCode(version=1, box_size=10, border=5); qr.add_data('http://%LOCAL_IP%:8000/'); qr.make(fit=True); img = qr.make_image(fill_color='black', back_color='white'); img.save('%FOLDER_PATH%\_folder_qr.png')"

:: 启动简单HTTP服务器
start "" python -m http.server 8000 --directory "%FOLDER_PATH%"

:: 显示二维码
start "" "%FOLDER_PATH%\_folder_qr.png"

:: 显示下载链接
echo 文件夹共享链接: http://%LOCAL_IP%:8000/
pause 