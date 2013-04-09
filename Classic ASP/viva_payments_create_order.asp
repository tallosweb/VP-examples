<%
' setup the URL
baseUrl = "http://demo.vivapayments.com/api/orders"

'Response.Write baseUrl
' setup the request and authorization
Set http = Server.CreateObject("Msxml2.ServerXMLHTTP.3.0")
http.open "POST", baseUrl, False', "0B586B1C-84AE-4259-8C93-DCDCB0266B86", "%^&YHNmju" ' 
http.setRequestHeader "Content-Type", "application/x-www-form-urlencoded"
http.setRequestHeader "Authorization", "Basic "&Base64Encode("1c204c59-9890-499c-bf5d-31e80dcdbdfd:a123456")

' send the HTTP data
http.send("Amount=100")

' here you pass the json result
response.write http.responsetext



' BASE64 function used to encode username password
Function MyASC(OneChar)
    If OneChar = "" Then MyASC = 0 Else MyASC = Asc(OneChar)
    End Function

    Function Base64Encode(inData)
    'rfc1521
    '2001 Antonin Foller, Motobit Software, http://Motobit.cz
 
    Const Base64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
    Dim cOut, sOut, I
 
    'For each group of 3 bytes
 
    For I = 1 To Len(inData) Step 3
    Dim nGroup, pOut, sGroup
 
    'Create one long from this 3 bytes.
 
    nGroup = &H10000 * Asc(Mid(inData, I, 1)) + _
    &H100 * MyASC(Mid(inData, I + 1, 1)) + MyASC(Mid(inData, I + 2, 1))
 
    'Oct splits the long To 8 groups with 3 bits
 
    nGroup = Oct(nGroup)
 
    'Add leading zeros
 
    nGroup = String(8 - Len(nGroup), "0") & nGroup
 
    'Convert To base64
 
    pOut = Mid(Base64, CLng("&o" & Mid(nGroup, 1, 2)) + 1, 1) + _
    Mid(Base64, CLng("&o" & Mid(nGroup, 3, 2)) + 1, 1) + _
    Mid(Base64, CLng("&o" & Mid(nGroup, 5, 2)) + 1, 1) + _
    Mid(Base64, CLng("&o" & Mid(nGroup, 7, 2)) + 1, 1)
 
    'Add the part To OutPut string
 
    sOut = sOut + pOut
 
    'Add a new line For Each 76 chars In dest (76*3/4 = 57)
    'If (I + 2) Mod 57 = 0 Then sOut = sOut + vbCrLf
 
    Next
    Select Case Len(inData) Mod 3
    Case 1: '8 bit final
 
    sOut = Left(sOut, Len(sOut) - 2) + "=="
    Case 2: '16 bit final
 
    sOut = Left(sOut, Len(sOut) - 1) + "="
    End Select
    Base64Encode = sOut
End Function
%>
