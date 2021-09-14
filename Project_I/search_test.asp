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



        set rs1=Server.CreateObject("ADODB.Recordset")
        sql1 = "SELECT MIN(DOB) as minDate, MAX(DOB) as maxDate FROM EMP"
        rs1.Open sql1,Conn
        if dfrom="" AND dto="" Then
            dfrom=rs1.Fields("minDate").Value
            dto=rs1.Fields("maxDate").Value
            'Response.Write dfrom
            'Response.Write dto
        elseif dfrom="" Then
            dfrom=rs1.Fields("minDate").Value
            'Response.Write dfrom
        else:
            dto=rs1.Fields("maxDate").Value
            'Response.Write dto
        end if
        rs1.close

        if s1 <> "" OR s2 <> "" OR s3 <> "" OR s4 <> "" OR s5 <> "" OR s6 <> "" OR s7 <> "" Then
            skl = 1
        else 
            skl = 0
        end if

        fsql = " Instr( fname, '" & fName & "')"
        gsql = " Gender='" & g & "'"
        dsql = " DOB BETWEEN #"& dfrom &"# AND #"& dto &"#"
        ssql =  " ID IN(SELECT Emp_ID FROM skills WHERE"
            ssql = ssql & " Skills='" & s1 & "' OR Skills='" & s2 & "' OR Skills='" & s3 & "'"
            ssql = ssql & " OR Skills='" & s4 & "' OR Skills='" & s5 & "' OR Skills='" & s6 & "'"
            ssql = ssql & " OR Skills='" & s7 & "')"

        sql = "SELECT * FROM EMP WHERE"
        if fName <> "" AND g <> "" AND skl = 1 Then
            sql = sql & fsql
            sql = sql & " AND"
            sql = sql & gsql
            sql = sql & " AND"
            sql = sql & dsql
            sql = sql & " AND"
            sql = sql & ssql
            sql = sql & " AND"
            sql = sql & dsql
            'response.write sql
            'response.end
        
        elseif fName <> "" AND g <> "" AND skl = 0 Then
            sql = sql & fsql
            sql = sql & " AND"
            sql = sql & gsql
            sql = sql & " AND"
            sql = sql & dsql
            'Response.write sql

        elseif fName <> "" AND g = "" AND skl = 1 Then
            sql = sql & fsql
            sql = sql & " AND"
            sql = sql & ssql
            sql = sql & " AND"
            sql = sql & dsql
            'Response.write sql

        elseif fName = "" AND g <> "" AND skl = 1 Then
            sql = sql & gsql
            sql = sql & " AND"
            sql = sql & ssql
            sql = sql & " AND"
            sql = sql & dsql
        elseif fName <> "" AND g = "" AND skl = 0 Then
            sql = sql & fsql
            sql = sql & " AND"
            sql = sql & dsql
            
            'Response.write sql

        elseif fName = "" AND g <> "" AND skl = 0 Then
            sql = sql & gsql
            sql = sql & " AND"
            sql = sql & dsql

        elseif fName = "" AND g = "" AND skl = 1 Then
            sql = sql & ssql
            sql = sql & " AND"
            sql = sql & dsql
        
        else 
            sql = sql & dsql
        end if
        
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