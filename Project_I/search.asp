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
        sqlWhere = " Instr( fname, '" & fName & "')"
    end if
    
    if gender <> "" Then
        if sqlWhere <> "" Then
            sqlWhere = sqlWhere & " AND"
        end if
        sqlWhere = sqlWhere & " Gender='" & gender & "'"
    end if

    if dfrom<>"" Then
        if sqlWhere <> "" Then
            sqlWhere = sqlWhere & " AND"
        end if
        sqlWhere = sqlWhere & " DOB>=#"& dfrom &"#"
    end if

    if dto<>"" Then
        if sqlWhere <> "" Then
            sqlWhere = sqlWhere & " AND"
        end if
        sqlWhere = sqlWhere & " DOB<=#"& dto &"#"
        
    end if

    'skills search logic
    if python<>"" OR php<>"" OR asp<>"" OR vue<>"" OR js<>"" OR react<>"" OR angular<>"" Then
        if sqlWhere <> "" Then
            sqlWhere = sqlWhere & " AND"
        end if
        sqlWhere = sqlWhere &  " ID IN(SELECT Emp_ID FROM skills WHERE Skills IN ("    
        sqlSkillsWhere = ""
        if python<>"" Then
            sqlSkillsWhere = "'" & python & "'"
        end if

        if php<>"" Then
            if sqlSkillsWhere <> "" Then
                sqlSkillsWhere = sqlSkillsWhere & ","
            end if
            sqlSkillsWhere = sqlSkillsWhere & "'" & php & "'"
        end if

        if asp<>"" Then
            if sqlSkillsWhere <> "" Then
                sqlSkillsWhere = sqlSkillsWhere & ","
            end if
            sqlSkillsWhere = sqlSkillsWhere & "'" & asp & "'"
        end if

        if vue<>"" Then
            if sqlSkillsWhere <> "" Then
                sqlSkillsWhere = sqlSkillsWhere & ","
            end if
            sqlSkillsWhere = sqlSkillsWhere & "'" & vue & "'"
        end if

        if js<>"" Then
            if sqlSkillsWhere <> "" Then
                sqlSkillsWhere = sqlSkillsWhere & ","
            end if
            sqlSkillsWhere = sqlSkillsWhere & "'" & js & "'"
        end if

        if react<>"" Then
            if sqlSkillsWhere <> "" Then
                sqlSkillsWhere = sqlSkillsWhere & ","
            end if
            sqlSkillsWhere = sqlSkillsWhere & "'" & react & "'"
        end if

        if angular<>"" Then
            if sqlSkillsWhere <> "" Then
                sqlSkillsWhere = sqlSkillsWhere & ","
            end if
            sqlSkillsWhere = sqlSkillsWhere & "'" & angular & "'"
        end if

        sqlWhere = sqlWhere & sqlSkillsWhere & "))"
            
    end if
    
    
    if sqlWhere <> "" Then
        sqlWhere = " WHERE" & sqlWhere
    end if 
    sql = sql & sqlWhere
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
