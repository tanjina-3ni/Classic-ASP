<%
Session.Timeout=5

if Session("username")="" Then
    uname = Request.Cookies("username")
    Session("username")= uname
end if
%>