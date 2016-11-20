xcopy /y "\\192.168.10.82\ξαμεν\!KORP_SOFT\prinfa\firebird\DLL\dbexpint.dll" "%windir%\system32\"
xcopy /y "\\192.168.10.82\ξαμεν\!KORP_SOFT\prinfa\firebird\DLL\midas.dll" "%windir%\SysWOW64\"
regsvr32 midas.dll