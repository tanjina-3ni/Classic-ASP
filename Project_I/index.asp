<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <style>
        .title_container {
        text-align: center;
        padding-bottom: 15px;
        }
        .form_wrapper {
        text-align: center;
        width: 400px;
        max-width: 100%;
        box-sizing: border-box;
        padding: 5px;
        margin: auto;
        margin-top: 10%;
        margin-bottom: 10%;
        position: relative;
        border: 4px;
        border-color: cadetblue;
        border-style: solid;
        background-color: rgb(157, 208, 228);
        }
        .button {
        background-color: rgba(206, 255, 253, 0.966);
        color: black;
        border: 2px solid #08a799;
        }
    </style>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">

</head>
<body>
    
    <div class="form_wrapper">
        <div class="title_container">
            <h2>Login Form</h2>
        </div>

        <form method="post" action="check.asp">
            <div class="form-label">
                <label class="col-md-4 control-label" ><strong>Email:</strong></label>  
                <input type="text" name="email" placeholder="Email" required><br> 
            
            </div>
            <br>
            <div class="form-label">
                <label class="col-md-4 control-label" ><strong>Password:</strong></label>  
                <input type="text" name="password" placeholder="Password" required><br> 
            
            </div>
            <br>
            <div>
                <input type="submit" class="btn btn-success" value="Login">
        </form>
        
        <form method="post" action="registration.asp">
            <br>
            <div>
                <input type="submit" class="button" value="Register">
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
</body>
</html>