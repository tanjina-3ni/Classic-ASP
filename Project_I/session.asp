<%
Session.Timeout=1

if Session("username")="" Then
    uname = Request.Cookies("username")
    Session("username")= uname
end if
%>