<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%
        set conn=Server.CreateObject("ADODB.Connection")
        conn.Provider="Microsoft.Jet.OLEDB.4.0"
        conn.Open "C:\inetpub\wwwroot\Project_I\Employee.mdb"

        dim email, pass
        email=Request.form("Email")
        pass=Request.form("password")

        sql="SELECT * from EMP where Email='" & email& "'and [Password]='" & pass & "'"

        on error resume next
        conn.Execute sql,recaffected

        conn.close


    %>
</body>
</html>