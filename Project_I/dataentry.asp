<%
    set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider="Microsoft.Jet.OLEDB.4.0"
    conn.Open "C:\inetpub\wwwroot\Project_I\Employee.mdb"

    's = Request.Form("s")
    'v = Split(Request.Form("s"),", ")

    'response.write(s)
    'response.write(TypeName(v))
    'response.end()

    

    sql="INSERT INTO EMP (Fname,Lname,"
    sql=sql & "Email,Phone,DOB,Gender,Website)"
    sql=sql & " VALUES "
    sql=sql & "('" & Request.Form("firstname") & "',"
    sql=sql & "'" & Request.Form("lastname") & "',"
    sql=sql & "'" & Request.Form("email") & "',"
    sql=sql & "'" & Request.Form("telephone") & "',"
    sql=sql & "'" & Request.Form("Birthdate") & "',"
    sql=sql & "'" & Request.Form("gender") & "',"
    sql=sql & "'" & Request.Form("website") & "')"
    'sql=sql & "'" & Request.Form("resume") & "')"

    on error resume next
    conn.Execute sql,recaffected


    set rs=Server.CreateObject("ADODB.recordset")
    rs.Open "SELECT MAX(ID) as id FROM EMP", conn 'WHERE Email='" & Request.Form("Email") & "'", conn
    
    id=rs("ID")
    rs.close
    
    skills = Split(Request.Form("skills"),", ")

    'response.write(s)
    'response.end()

    for each skill in skills
        sql1="INSERT INTO skills (Skills,Emp_ID)"
        sql1=sql1 & " VALUES "
        sql1=sql1 & "('" & skill & "',"
        sql1=sql1 & "" & id & ")"
        on error resume next
        conn.Execute sql1,recaffected
    next

    
    'response.write sql1
    'response.end()

    
    if err<>0 then
        Response.Write("No update permissions!")
    else
        Response.Redirect "display.asp"
        
    end if
    conn.close
%>
