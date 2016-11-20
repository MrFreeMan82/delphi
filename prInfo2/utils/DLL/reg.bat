xcopy /y "\\192.168.10.82\install$\!KORP_PO\prinfa\firebird\DLL\dbexpint.dll" "%windir%\system32\"
xcopy /y "\\192.168.10.82\install$\!KORP_PO\prinfa\firebird\DLL\midas.dll" "%windir%\system32\"
regsvr32 midas.dll