<!DOCTYPE html>
<html>
<body>
<%
Dim a(2)
a(0) = 5
a(1) = 10
a(2) = 15

For Each i in a
    response.write( i &"<br/>")
Next
%>
</body>
</html>