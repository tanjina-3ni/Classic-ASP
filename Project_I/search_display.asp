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
    
    <div class="card-body">
        <div class="title_container">
            <h3>All Records</h3>
        </div>

        <table class="table table-striped">
            <thead>
                <tr>
                    <tr>
                        <th>ID</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>DOB</th>
                        <th>Gender</th>
                        <th>Website</th>
                        <th>Action</th>
                    </tr>
                </tr>
            </thead>
            <tbody>
                <%
                 do until rs.EOF
                %>
                <tr>
                    <%
                     for each x in rs.Fields
                        if x.name="ID" Then
                            id = x.value
                        end if
                    %>
                        <td><%Response.Write(x.value)%></td>
                    <%
                     next
                     rs.MoveNext
                    %>
                    
                        <td>
                            <a href="editnew.asp?id=<%Response.Write(id)%>" class="btn btn-success" >Edit
                            <a href="delete.asp?id=<%Response.Write(id)%>" class="btn btn-danger" >Delete
                        </td>
                </tr>
            <%
             loop
             rs.close
             conn.close

            %>
                        

            
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>

</body>
</html>