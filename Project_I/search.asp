<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search</title>
    <style>
        .alert {
        opacity: 1;
        transition: opacity 0.6s; /* 600ms to fade out */
        }
    </style>
</head>
<body>
    <script LANGUAGE='JavaScript'>
        function errMsg()
        {
        window.alert('Succesfully Updated');
        window.location.href='display.asp';
        }
    </script>
    <%
        set conn=Server.CreateObject("ADODB.Connection")
        conn.Provider="Microsoft.ACE.OLEDB.12.0"
        conn.Open "C:\inetpub\wwwroot\Project_I\Employee.mdb"
        'conn.Open "Employee.mdb"
        
        fName=Request.Form("search")
        g=Request.Form("gender")
        dfrom = Request.Form("from")
        dto = Request.Form("to")
        s1=Request.Form("s1")
        s2=Request.Form("s2")
        s3=Request.Form("s3")
        s4=Request.Form("s4")
        s5=Request.Form("s5")
        s6=Request.Form("s6")
        s7=Request.Form("s7")
        'Response.Write fName

        if fName="" OR dfrom="" OR dto="" Then
            Response.Write "Please Fill ALL Records."
            Response.end
        end if
    
        sql = "SELECT * FROM EMP WHERE Instr( fname, '" & fName & "')"
        sql = sql & " AND Gender='" & g & "'"
        sql = sql & " AND DOB BETWEEN #"& dfrom &"# AND #"& dto &"#"
        sql = sql & " AND ID IN(SELECT Emp_ID FROM skills WHERE"
        sql = sql & " Skills='" & s1 & "' OR Skills='" & s2 & "' OR Skills='" & s3 & "'"
        sql = sql & " OR Skills='" & s4 & "' OR Skills='" & s5 & "' OR Skills='" & s6 & "'"
        sql = sql & " OR Skills='" & s7 & "')"
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