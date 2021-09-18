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
        gender = Request.Form("gender")
        dfrom = Request.Form("from")
        dto = Request.Form("to")
        python = Request.Form("Python")
        php = Request.Form("PHP")
        asp = Request.Form("ASP")
        vue = Request.Form("Vue")
        js = Request.Form("Javascript")
        react = Request.Form("React")
        angular = Request.Form("Angular")

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
        sql = "SELECT ID, fname +' '+ lname as name, Email, DOB, Gender FROM EMP"
        sqlWhere = ""
        if fName <> "" Then
            sqlWhere = " WHERE Instr( fname, '" & fName & "')"
        end if
        
        if gender <> "" Then
            if sqlWhere = "" Then
                sqlWhere = " WHERE Gender='" & gender & "'"
            else 
                sqlWhere = sqlWhere & " AND Gender='" & gender & "'"
            end if
            'Response.write sql
        end if

        if dfrom<>"" Then
            if sqlWhere = "" Then
                sqlWhere = " WHERE DOB>=#"& dfrom &"#"
            else 
                sqlWhere = sqlWhere & " AND DOB>=#"& dfrom &"#"
            end if
        end if

        if dto<>"" Then
            if sqlWhere = "" Then
                sqlWhere = " WHERE DOB<=#"& dto &"#"
            else
                sqlWhere = sqlWhere & " AND DOB<=#"& dto &"#"
            end if
        end if

        'skills search logic
        if python<>"" OR php<>"" OR asp<>"" OR vue<>"" OR js<>"" OR react<>"" OR angular<>"" Then
            if sqlWhere = "" Then
                sqlWhere = " WHERE ID IN(SELECT Emp_ID FROM skills WHERE"
                sqlWhere = sqlWhere & " Skills IN ('" & python & "', '" & php & "', '" & asp & "', '" & vue & "', '" & js & "', '" & react & "', '" & angular & "'))"
            else
                sqlWhere = sqlWhere & " AND ID IN(SELECT Emp_ID FROM skills WHERE"
                sqlWhere = sqlWhere & " Skills IN ('" & python & "', '" & php & "', '" & asp & "', '" & vue & "', '" & js & "', '" & react & "', '" & angular & "'))"
            end if
        end if
        
        'response.write sql
        'response.end
        sql = sql & sqlWhere
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