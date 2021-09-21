<%
    set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider="Microsoft.Jet.OLEDB.4.0"
    conn.Open "C:\inetpub\wwwroot\Project_I\Employee.mdb"

    
    uname=Request.form("uname")
    pass=Request.form("password")


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
            'If remember me selected
            if RememberMe = "ON" then
                'Writing cookies permanently
                Response.Cookies("username")=uname
                Response.Cookies("password")=pass
                Response.Cookies("username").Expires = Now() + 365
                Response.Cookies("password").Expires = Now() + 365
                Response.Redirect "display.asp"
            else
                'writing cookies temporarily
                Response.Cookies("username")=uname
                Response.Cookies("password")=pass
                Response.Redirect "display.asp"
            end if
        end if
        conn.close
        rs.close
    end if
%>

