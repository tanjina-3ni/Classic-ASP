<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search</title>
    
</head>
<body>
    <%
        set conn=Server.CreateObject("ADODB.Connection")
        conn.Provider="Microsoft.ACE.OLEDB.12.0"
        conn.Open "C:\inetpub\wwwroot\Project_I\Employee.mdb"
        'conn.Open "Employee.mdb"
        set rs=Server.CreateObject("ADODB.recordset")

        s1=Request.QueryString("s1")
        s2=Request.QueryString("s2")
        s3=Request.QueryString("s3")
        s4=Request.QueryString("s4")
        s5=Request.QueryString("s5")
        s6=Request.QueryString("s6")
        s7=Request.QueryString("s7")
        
        rs.Open "SELECT * FROM EMP WHERE ID IN(SELECT Emp_ID FROM skills WHERE Skills='" & s1 & "' OR Skills='" & s2 & "' OR Skills='" & s3 & "' OR Skills='" & s4 & "' OR Skills='" & s5 & "' OR Skills='" & s6 & "' OR Skills='" & s7 & "')", conn
    
        'sql = "SELECT * FROM EMP WHERE ID IN(SELECT Emp_ID FROM skills WHERE Skills='" & s1 & "' OR Skills='" & s2 & "' OR Skills='" & s3 & "' OR Skills='" & s4 & "' OR Skills='" & s5 & "' OR Skills='" & s6 & "' OR Skills='" & s7 & "')"
        'response.write sql
        'response.end

       
    %>
    
    <!--#include file="search_display.asp"-->

</body>
</html>