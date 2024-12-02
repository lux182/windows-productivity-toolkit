@echo off

chcp 65001 >nul

python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo 未检测到 Python，请先安装 Python
    pause
    exit /b 1
)

python -m pip install qrcode[pil] --quiet

reg add "HKEY_CLASSES_ROOT\Directory\shell\GenerateQRCode" /ve /d "生成文件夹共享二维码" /f

reg add "HKEY_CLASSES_ROOT\Directory\shell\GenerateQRCode\command" /ve /d "\"%~dp0qr_code_generator.bat\" \"%%1\"" /f

echo 安装完成！右键文件夹即可生成共享二维码

pause 