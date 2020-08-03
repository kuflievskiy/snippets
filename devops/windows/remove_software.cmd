# REG DELETE HKEY_CURRENT_USER\Software\JetBrains\PhpStorm

SET /P "login=Please type your login and press Enter to start: "
ECHO "Login : %login%"

REG DELETE HKEY_CURRENT_USER\Software\JetBrains

rmdir C:\Users\%login%\.WebIde90 /s /q
rmdir C:\Users\%login%\.WebIde95 /s /q
rmdir C:\Users\%login%\.WebIde100 /s /q

pause
# SHUTDOWN -r -t 10

# go to https://confluence.jetbrains.com/display/PhpStorm/PhpStorm+Early+Access+Program
# and download ZIP with new version