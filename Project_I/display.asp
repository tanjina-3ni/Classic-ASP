<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <title>Records</title>

    <style>
        .title_container {
            text-align: center;
            padding-bottom: 15px;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>
<body>
    <%
        set conn=Server.CreateObject("ADODB.Connection")
        conn.Provider="Microsoft.ACE.OLEDB.12.0"
        conn.Open "C:\inetpub\wwwroot\Project_I\Employee.mdb"
        'conn.Open "Employee.mdb"

        set rs=Server.CreateObject("ADODB.recordset")
        rs.Open "SELECT * FROM EMP ORDER BY ID", conn
        
    %>

    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
        $('#searchButton').click(function() {
            $.ajax({
                    type: "POST",
                    url: "search.asp",
                    data:  $("#formID").serialize(),
                    cache: false,
                    dataType: "html",
                    success: function(response){
                        alert("Click ok to search");
                        $('#searchDisplay').html(response.toString());
                    },
                    error: function(respose){
                        alert(respose);
                    },
                });

            return false;
        });
        });
        
    </script>


    <div class="card-body" >
        <div class="title_container">
            <h3>All Records</h3>
        </div>

        <!--#include file="navbar.asp"-->
        


        <table class="table table-striped" id="searchDisplay">
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