
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
            id = rs("ID")
        %>
        <tr style='background: none;' id="<%=(id)%>">
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

