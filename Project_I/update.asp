<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update</title>
</head>
<body>

    <%
    set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider="Microsoft.Jet.OLEDB.4.0"
    conn.Open "C:\inetpub\wwwroot\Project_I\Employee.mdb"

    id = Request.QueryString("id")

    sql="UPDATE EMP SET "
    sql=sql & "fname='" & Request.Form("fname") & "',"
    sql=sql & "lname='" & Request.Form("lname") & "',"
    sql=sql & "Email='" & Request.Form("Email") & "',"
    sql=sql & "Phone='" & Request.Form("Phone") & "',"
    sql=sql & "DOB='" & Request.Form("DOB") & "',"
    sql=sql & "Gender='" & Request.Form("Gender") & "',"
    sql=sql & "Website='" & Request.Form("Website") & "'"
    sql=sql & " WHERE ID=" & id & ""
    on error resume next
    conn.Execute sql
    

    v = Split(Request.Form("Skills"),", ")
    

    sql1="DELETE * FROM skills"
    sql1=sql1 & " WHERE Emp_ID=" & id & ""
    on error resume next
    conn.Execute sql1

    for each x in v
        sql2="INSERT INTO skills (Skills,Emp_ID)"
        sql2=sql2 & " VALUES "
        sql2=sql2 & "('" & x & "',"
        sql2=sql2 & "" & id & ")"
        on error resume next
        conn.Execute sql2
    next

    
    'response.end()
    
    if err<>0 then
        response.write("No update permissions!")
    else
        Response.Redirect "display.asp"
    end if
    conn.close
    %>
   
</body>
</html>