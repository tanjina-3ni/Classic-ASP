<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit</title>
        <style>
            .myDiv {    
                text-align: center;}
        </style>
        
</head>
<body>
    <%
        set conn=Server.CreateObject("ADODB.Connection")
        conn.Provider="Microsoft.Jet.OLEDB.4.0"
        conn.Open "C:\inetpub\wwwroot\Project_I\Employee.mdb"

        id = Request.QueryString("id")
         
        set rs=Server.CreateObject("ADODB.Recordset")
        rs.open "SELECT * FROM EMP WHERE ID=" & id,conn

    %>
    <form method="post" action="update.asp?id=<%Response.Write(id)%>">
        <table>
            <%for each x in rs.Fields%>
            <tr>
                
                <td><%=x.name%></td>
                <td><input name="<%=x.name%>" value="<%=x.value%>"></td>

            <%next%>
            </tr>
        </table>
        <br><br>
        <input type="submit" value="Update record">
        
    </form>
        
       
    <% conn.close %>
    
      
</body>
</html>