;Include Internet Explorer library
#include <IE.au3>

#include <MsgBoxConstants.au3>

Local $aArray = FileReadToArray("C:\Users\dhe\Desktop\PingSensors.txt")

;Define username & password
Local $uName="prtgadmin"
Local $Pwd=""

;Open browser window and navigate to prtg
$oIE = _IECreate(); Create a new browser window
_IENavigate($oIE, "http://prtg/group.htm?id=0&tabid=1")

;Enter Username and Password into form
Local $oForm = _IEFormGetObjByName($oIE, "loginform")
Local $oText = _IEFormElementGetObjByName($oForm, "username")
Local $oText1 = _IEFormElementGetObjByName($oForm, "password")
_IEFormElementSetValue($oText, $uName)
_IEFormElementSetValue($oText1, $Pwd)
_IEFormSubmit($oForm)

For $i = 0 To UBound($aArray) - 1 ; Loop through the array.
	  _IENavigate($oIE, "http://prtg/sensor.htm?id=" & $aArray[$i] & "&tabid=8")
	  Local $oForm = _IEFormGetObjByName($oIE, "objectdataform")
	  $obj_radio = _IEGetObjByName($oIE, "dependencytype_")
	  _IEFormElementCheckBoxSelect($oForm, 1, "", 0, "byIndex")
	  _IEFormElementSetValue($obj_radio, "2")
	  _IEFormSubmit($oForm)
Next

