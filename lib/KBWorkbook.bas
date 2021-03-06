Attribute VB_Name = "KBWorkbook"
Option Explicit

''''''''''''''''''''''''''''''''''''''''''''''''''''
' Function          : IsExistWorkbook
' Description       : Check If a workbook exists
' Author            : Jingun Jung
' Licence           : Apache License 2.0
' Source            : https://github.com/koreabigname/excel-vba-template
' Date              : 2015-04-18
' Parameters        : strWorkbookName    - Workbook name
' Called By         : This.MakeWorkbook
' Value Returned    : Boolean - True is existing
' Modification History
'
'   Author          Date          Reason      Comment
'   ------------    ----------    --------    ---------
'
''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Function IsExistWorkbook( _
    ByVal strWorkbookName As String _
) As Boolean

Dim objWB As Workbook
Dim blnExistResult As Boolean

blnExistResult = False

For Each objWB In Workbooks
  
    If (objWB.Name = strWorkbookName) Then

        blnExistResult = True
        Exit For
        
    End If
  
Next objWB

Set objWB = Nothing

IsExistWorkbook = blnExistResult

End Function

''''''''''''''''''''''''''''''''''''''''''''''''''''
' Function          : MakeWorkbook
' Description       : SaveAs in Excel 2007-2013
' Author            : Jingun Jung
' Licence           : Apache License 2.0
' Source            : https://github.com/koreabigname/excel-vba-template
' Date              : 2015-04-18
' Parameters        : strPath     - SaveAs path
'                     strFilename - SaveAs filename
' Called By         : Nothing
' Value Returned    : Nothing
' Modification History
'
'   Author          Date          Reason      Comment
'   ------------    ----------    --------    ---------
'   Jingun Jung     2015-04-21    UPDATED     Save Extension
'
''''''''''''''''''''''''''''''''''''''''''''''''''''
Public Sub MakeWorkbook( _
    ByVal strPath As String, _
    ByVal strFileName As String _
)

Dim objWB As Workbook
Dim strExtension As String

strExtension = GetExtensionNameForSpecifiedPath(strFileName)

If (IsExistWorkbook(strFileName) = True) Then
    
    Workbooks(strFileName).Close

End If

Set objWB = Workbooks.Add

Select Case LCase(strExtension)
Case "xlsx"
    objWB.SaveAs Filename:=strPath & "\" & strFileName, FileFormat:=xlOpenXMLWorkbook, Local:=True  ' 51
Case "xlsm"
    objWB.SaveAs Filename:=strPath & "\" & strFileName, FileFormat:=xlOpenXMLWorkbookMacroEnabled, Local:=True  ' 52
Case Else
    objWB.SaveAs Filename:=strPath & "\" & strFileName, FileFormat:=xlWorkbookNormal, Local:=True
End Select

Set objWB = Nothing

End Sub

