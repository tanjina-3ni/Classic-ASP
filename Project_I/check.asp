<%
    uname=Request.form("uname")
    pass=Request.form("password")

    msg = ""

    set regEx = New RegExp
    regEx.Pattern = "[a-zA-Z0-9]"
    isValidE = regEx.Test(uname)
    if isValidE="False" Then
        msg = msg + "Enter a valid User Name<br>"
    end if

    regEx.Pattern = "^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
    isValidE = regEx.Test(pass)
    if isValidE="False" Then
        msg = msg + "Enter a valid Password (Minimum eight characters, at least one letter and one number)<br>"
    end if

    if msg<>"" Then 
        response.write(msg)
        response.end
    end if


    set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider="Microsoft.Jet.OLEDB.4.0"
    conn.Open "C:\inetpub\wwwroot\Project_I\Employee.mdb"

    
    

    if uname="" or pass="" Then
        response.End
        response.Redirect 'index.asp'

    'If not blank Username password submitted
    elseif uname <> "" and pass <> "" then
        sql="SELECT * from signup where uname='" & uname & "'"
        'Response.write sql
        'response.end
        on error resume next
        set rs=Conn.execute(sql)
        
        'response.write sql

        'If no records retrieved
        if rs.BOF and rs.EOF then
            Response.Redirect "index.asp?uname=" & uname
        elseif rs("password")<>pass Then
            Response.Redirect "index.asp?pass=" & pass
        else 
            Session("username")=uname
            Response.Cookies("username")=uname
            Response.Redirect "display.asp"
        end if
        conn.close
        rs.close
    end if
%>

