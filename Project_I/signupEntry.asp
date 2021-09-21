<%
    ' server side validation
    uname = Request.Form("uname")
    password = Request.Form("password")
    

    msg = ""
    if uname="" Then
        msg = msg + "Enter User Name<br>"
    end if

    if password="" Then
        msg = msg + "Enter Password<br>"
    end if

    if msg<>"" Then 
        response.write(msg)
        response.end
    end if


    ' connect to the database
    set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider="Microsoft.Jet.OLEDB.4.0"
    conn.Open "C:\inetpub\wwwroot\Project_I\Employee.mdb"

    's = Request.Form("s")
    'v = Split(Request.Form("s"),", ")

    'response.write(s)
    'response.write(TypeName(v))
    'response.end()
    existUser = "SELECT * FROM signup WHERE uname='" & uname & "'"
    set rs = conn.Execute(existUser)
    
    'If no records retrieved
    if rs.BOF and rs.EOF then
        
        

        sql="INSERT INTO signup (uname,[password])"
        sql=sql & " VALUES "
        sql=sql & "('" & uname & "',"
        sql=sql & "'" & password & "')"
        'on error resume next
        conn.Execute sql,recaffected
        'response.write sql
        'response.end()
        
        if err<>0 then
            Response.Write("No update permissions!")
        else
            Response.Redirect "registration.asp"
            
        end if
        
    else
        Response.Redirect "signup.asp"
    end if
    rs.close
    conn.close
%>
