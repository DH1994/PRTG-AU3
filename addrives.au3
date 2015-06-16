#include <IE.au3>
#include <Array.au3>
#include <MsgBoxConstants.au3>
#include <File.au3>

Local $aArray = FileReadToArray("C:\Users\mvel\Desktop\hddids.txt")
Local $bArray[0]

_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|C:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|D:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|E:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|F:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|G:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|H:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|I:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|J:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|K:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|L:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|M:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|N:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|O:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|P:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|Q:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|R:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|S:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|T:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|U:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|V:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|W:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|X:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|Y:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")
_ArrayAdd($bArray, "PercentFreeSpace|% Free Space|Z:|Win32_PerfFormattedData_PerfDisk_LogicalDisk|65536|||0|203|5||||","","*")

;Define username & password
Local $uName="prtgadmin"
Local $Pwd=""
;Open browser window and navigate to member6
$oIE = _IECreate(); Create a new browser window
Sleep(3000)
Send("{F11}")


For $j = 0 to Ubound($aArray)
_IENavigate($oIE, "http://prtg/addsensor.htm?id=" & $aArray[$j])
Local $oForm = _IEFormGetObjByName($oIE, "loginform")
Local $oText = _IEFormElementGetObjByName($oForm, "username")
Local $oText1 = _IEFormElementGetObjByName($oForm, "password")
_IEFormElementSetValue($oText, $uName)
_IEFormElementSetValue($oText1, $Pwd)
_IEFormSubmit($oForm)
Sleep(5000)
Send("wmi logical disk")
Sleep(5000)
        $coordinates = PixelSearch(0, 0, 1920, 1080, 0xF26522)
        If IsArray($coordinates) Then MouseClick("left", $coordinates[0], $coordinates[1], 1, 0)
	    sleep(15000)
		Local $oForm = _IEFormGetObjByName($oIE, "addobjectdialogform")
		   for $i = 0 to 23
			  sleep(500)
			   _IEFormElementCheckBoxSelect($oForm, $bArray[$i], "datafieldlist__check", 1, "byValue")
			Next
			_IEFormSubmit($oForm)
			$j = $j + 1
Next

