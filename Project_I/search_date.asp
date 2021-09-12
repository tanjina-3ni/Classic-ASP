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


        dfrom = Request.QueryString("from")
        dto = Request.QueryString("to")
        'response.write dfrom
        'response.write TypeName(dto)
        rs.Open "SELECT * FROM EMP WHERE DOB BETWEEN #"& dfrom &"# and #"& dto &"#", conn
        'sql = "SELECT * FROM EMP WHERE DOB BETWEEN '" & dfrom & "' AND '" & dto & "'"
        'response.write sql
        'response.end
        
    %>
    
    <!--#include file="search_display.asp"-->
    
</body>
</html>