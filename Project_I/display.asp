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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="ajax.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>
<body>
    <%
        set conn=Server.CreateObject("ADODB.Connection")
        conn.Provider="Microsoft.ACE.OLEDB.12.0"
        conn.Open "C:\inetpub\wwwroot\Project_I\Employee.mdb"

        set rs=Server.CreateObject("ADODB.recordset")
        sql = "SELECT ID, fname +' '+ lname as name, Email, DOB, Gender FROM EMP ORDER BY ID"
        rs.Open sql, Conn
        
    %>


    <div class="card-body" >
        <div class="title_container">
            <h3>All Records</h3>
        </div>

        <!--#include file="navbar.asp"-->
        


        <table class="table table-striped" id="searchDisplay">
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
                If Not rs.EOF Then 
                    data = rs.GetRows()
                end if

                Dim row, rows

                If IsArray(data) Then
                'Test data (2d Array, 0 = column, 1 = row)
                'Retrieving all rows
                    rows = UBound(data, 2)
                    For row = 0 To rows
                        'First column from each row.
                        'Call WScript.Echo(data(0, row))
                        id = data(0, row)
                
                %>
                <tr style='background: none;' id="<%=(id)%>">
                    <td><%=(data(0, row))%></td>
                    <td><%=(data(1, row))%></td>
                    <td><%=(data(2, row))%></td>
                    <td><%=(data(3, row))%></td>
                    <td><%=(data(4, row))%></td>
                    <td>
                        <a href="editnew.asp?id=<%=(id)%>" class="btn btn-success" >Edit
                        <a id="delete_button<%=(id)%>" class="btn btn-danger" onclick="delete_row('<%=(id)%>');">Delete
                    </td>
                </tr>
                <%
                    Next
                End If
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