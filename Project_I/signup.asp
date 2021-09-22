<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>

    <link rel="stylesheet" href="style.css">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

</head>
<body>
    <%
    msg1 = Request.QueryString("msg1")
    msg2 = Request.QueryString("msg2")
    %>
    <div class="login_form_wrapper">
        <div class="title_container">
            <h3>Registration Form</h3>
        </div>

        <form method="post" action="signupEntry.asp">
            <div class="form-label">
                <label class="col-md-4 control-label" ><strong>User Name</strong></label>  
                <input type="text" name="uname" placeholder="User Name" required><br> 
            
            </div>
            <% 'Invalid Username password
                if msg1 <> "" then %>
                    <p align="center"><font face="Verdana">
                    </font><font size="2" color="red"><% Response.Write(msg1) %></font></font></p>
             <% end if %>
            <div class="form-label">
                <label class="col-md-4 control-label" ><strong>Password</strong></label>  
                <input type="text" name="password" placeholder="Password" required><br> 
            </div>
            <% if msg2<> "" Then %>
                    <p align="center"><font face="Verdana">
                    </font><font size="2" color="red"><% Response.Write(msg2) %></font></font></p>
            <% end if %>
            <div>
                <input type="submit" class="btn btn-success" value="Confirm">
        </form>
        
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
</body>
</html>