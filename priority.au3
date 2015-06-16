;Include Internet Explorer library
#include <IE.au3>
#include <Array.au3>
#include <File.au3>
#include <MsgBoxConstants.au3>

Local $aArray, $FPath = "C:\Users\dhe\Desktop\prio.csv", $csv[1000][6], $csvvar[1000]
 $aArray = FileReadToArray($FPath)

For $i = 0 To UBound($aArray) - 1
   $csvvar = StringSplit($aArray[$i], ";")
   $csv[$i][0] = $csvvar[1]
   $csv[$i][1] = $csvvar[2]
   $csv[$i][2] = $csvvar[3]
   $csv[$i][3] = $csvvar[4]
   $csv[$i][4] = $csvvar[5]
Next

_ArrayDisplay($csv, "Original", Default)

;Define username & password
Local $uName="prtgadmin"
Local $Pwd=""

;Open browser window and navigate to member6
$oIE = _IECreate(); Create a new browser window
_IENavigate($oIE, "http://prtg/group.htm?id=0&tabid=1")

;Enter Username and Password into form
Local $oForm = _IEFormGetObjByName($oIE, "loginform")
Local $oText = _IEFormElementGetObjByName($oForm, "username")
Local $oText1 = _IEFormElementGetObjByName($oForm, "password")
_IEFormElementSetValue($oText, $uName)
_IEFormElementSetValue($oText1, $Pwd)
_IEFormSubmit($oForm)

For $i = 1 To UBound($aArray) - 1 ; Loop through the array.
	  _IENavigate($oIE, "http://prtg/device.htm?id=" & $csv[$i][0] & "&tabid=7")
	  Local $oForm = _IEFormGetObjByName($oIE, "objectdataform")
	  Local $oSelect = _IEFormElementGetObjByName($oForm, "priority_")
	  _IEFormElementOptionSelect($oSelect, $csv[$i][1], 1, "byValue")
	  _IEFormSubmit($oForm)
Next

