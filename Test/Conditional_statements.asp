<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=\, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%
    d = weekday(date)
    
    If d=1 Then
        response.write("Sunday")
    ElseIf d=2 Then 
        response.write("Monday")
    ElseIf d=3 Then
        response.write("Tuesday")
    Else
        response.write("Wednesday")
    End If
    %>
</body>
</html>