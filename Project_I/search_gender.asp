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
        
        g=Request.QueryString("gender")
        rs.Open "SELECT * FROM EMP WHERE Gender='" & g & "'", conn

        
    %>
    
    <!--#include file="search_display.asp"-->
    

    
</body>
</html>