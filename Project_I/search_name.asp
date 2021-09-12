<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search</title>
    
</head>
<body>
    
    <%
    'form method was 'get'
        set conn=Server.CreateObject("ADODB.Connection")
        conn.Provider="Microsoft.ACE.OLEDB.12.0"
        conn.Open "C:\inetpub\wwwroot\Project_I\Employee.mdb"
        'conn.Open "Employee.mdb"
        
        fName=Request.QueryString("search")
        'Response.Write fName
    
        sql = "SELECT * FROM EMP WHERE Instr( fname, '" & fName & "')"
        set rs=Server.CreateObject("ADODB.Recordset")
        rs.Open sql, Conn
        
        'response.write sql
        'response.end
       
    %>

    <!--#include file="search_display.asp"-->
    

    
</body>
</html>