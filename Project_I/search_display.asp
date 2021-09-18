<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search</title>
    <style>
        .title_container {
            text-align: center;
            padding-bottom: 15px;
        }
        
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

</head>
<body>
    
    
        <table class="table table-striped">
            
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>DOB</th>
                    <th>Gender</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                do until rs.EOF
                %>
                <tr>
                    <%
                        id = rs("ID")
                    %>
                    <td><%Response.Write(id)%></td>
                    <td><%Response.Write(rs("name"))%></td>
                    <td><%Response.Write(rs("Email"))%></td>
                    <td><%Response.Write(rs("DOB"))%></td>
                    <td><%Response.Write(rs("Gender"))%></td>
                    <%
                    rs.MoveNext
                    %>
                    <td>
                        <a href="editnew.asp?id=<%Response.Write(id)%>" class="btn btn-success" >Edit
                        <a id="delete_button<%Response.Write(id)%>" class="btn btn-danger" onclick="delete_row('<%Response.Write(id)%>');">Delete
                    </td>
                </tr>
            <%
            loop
            rs.close
            conn.close

            %>
                        

            
            </tbody>
        </table>
    

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>

</body>
</html>