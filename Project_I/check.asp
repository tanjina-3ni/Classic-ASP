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
