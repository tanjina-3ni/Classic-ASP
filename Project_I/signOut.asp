<%
session.abandon
Response.Cookies("username")=""
Response.Redirect "index.asp"
%>