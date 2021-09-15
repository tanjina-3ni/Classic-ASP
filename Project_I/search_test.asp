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
        
        fName = Request.Form("search")
        g = Request.Form("gender")
        dfrom = Request.Form("from")
        dto = Request.Form("to")
        s1 = Request.Form("s1")
        s2 = Request.Form("s2")
        s3 = Request.Form("s3")
        s4 = Request.Form("s4")
        s5 = Request.Form("s5")
        s6 = Request.Form("s6")
        s7 = Request.Form("s7")
        

        'fName=Request.QueryString("search")
        'g=Request.QueryString("gender")
        'dfrom = Request.QueryString("from")
        'dto = Request.QueryString("to")
        's1=Request.QueryString("s1")
        's2=Request.QueryString("s2")
        's3=Request.QueryString("s3")
        's4=Request.QueryString("s4")
        's5=Request.QueryString("s5")
        's6=Request.QueryString("s6")
        's7=Request.QueryString("s7")



        'search Condition
        sql = "SELECT * FROM EMP WHERE ( " & fName & " IS NULL OR fname = '" & fName & "') AND (" & g & " IS NULL OR Gender ='" & g & "')"

       
        'response.write sql
        'response.end
        set rs=Server.CreateObject("ADODB.Recordset")
        rs.Open sql, Conn
        if not rs.BOF then
    %>

        <!--#include file="search_display.asp"-->

    <% 
        else 
        Response.Write "No Such Record!"
        Response.end
        end if
    %>
    

    
</body>
</html>