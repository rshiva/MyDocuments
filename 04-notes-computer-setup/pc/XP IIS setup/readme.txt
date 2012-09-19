运行 Regedt32.exe

删除注册表中的键：
? HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MSDTC
? HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\MSDTC
? HKEY_CLASSES_ROOT\CID
2、停止MSDTC服务：net stop msdtc
3、卸载MSDTC服务：msdtc -uninstall
4、重新安装MSDTC服务：msdtc -install
5、卸载IIS，重新安装IIS，



