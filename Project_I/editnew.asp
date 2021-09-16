<!DOCTYPE html>
<html lang="en">
<head>
    <title>Updation</title>

    <style>
        .myDiv {    
            text-align: center;}

        .form_wrapper {
            width: 460px;
            max-width: 100%;
            box-sizing: border-box;
            margin: auto;
            margin-top: 5%;
            margin-bottom: 5%;
            position: relative;
            border: darkcyan;
            border-style: solid;
            background-color: rgb(157, 208, 228);
            width: 40%;
            padding: 15px;
            
        }

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
        conn.Provider="Microsoft.Jet.OLEDB.4.0"
        conn.Open "C:\inetpub\wwwroot\Project_I\Employee.mdb"

        id = Request.QueryString("id")
         
        set rs=Server.CreateObject("ADODB.Recordset")
        rs.open "SELECT * FROM EMP WHERE ID=" & id,conn

        set rs1=Server.CreateObject("ADODB.Recordset")
        rs1.open "SELECT Skills FROM skills WHERE Emp_ID=" & id,conn
        

        
        Dim skls
        skls = rs1.GetRows()
        
        rs1.close
        python=php=asp=js=react=vue=angular=0
        For each skl in skls
            'response.write x
            if skl="Python" Then
                python=1
               'response.write s1
            elseif skl="PHP" Then
                php=1
                'response.write s2
            elseif skl="ASP" then
                asp=1
                'response.write s3
            elseif skl="Javascript" Then
                js=1
                'response.write s4
            elseif skl="React" Then
                react=1
                'response.write s5
            elseif skl="Vue" Then
                vue=1
                'response.write s6
            elseif skl="Angular" Then
                angular=1
                'response.write s7
            end if
        Next
        'response.end

        if not rs.eof then
%>
    <div class="form_wrapper">
        <div class="myDiv">
            
            <div class="title_container">
                <h2>Updation Form</h2>
            </div><br>
            <div class="mb-3 row">
                <form method="post" action="update.asp?id=<%Response.Write(id)%>">
                    
                    <div class="form-label">  
                        <label class="col-md-4 control-label" ><strong>First name:</strong></label>  
                        <input name="fname" value="<%=rs("fname")%>"> <br>
                    </div>

                    <br>

                    <div class="form-label">
                        <label class="col-md-4 control-label" ><strong>Last name:</strong></label>  
                        <input type="text" name="lname" value="<%=rs("lname")%>"><br> 
                    
                    </div>

                    <br>

                    <div class="form-label"> 
                        <label class="col-md-4 control-label" ><b>Email-address:</b></label> 
                        <input type="email" name="Email" value="<%=rs("Email")%>">      
                    </div>
                    <br>

                    <div class="form-label">
                        <label class="col-md-4 control-label" ><b>Mobile Number:</b></label> 
                        <input type="tel" name="Phone" value="<%=rs("Phone")%>">  
                    </div>  
                
                    <br>

                
                    <div class="form-label"> 
                        <label class="col-md-4 control-label" ><b>Date of Birth:</b></label>
                        <input type="text" name="DOB" value="<%=rs("DOB")%>"><br>
                    </div>


                    <br>
                    <div class="form-label">
                
                        <label class="col-md-4 control-label" ><strong>Gender:</strong></label>
                    
                        <input type="radio" name="Gender" <% if rs("Gender")="Male" then %> checked="checked"<%End if%> value="Male"> Male
                        <input type="radio" name="Gender" <% if rs("Gender")="Female" then %> checked="checked"<%End if%> value="Female"> Female 
                        <input type="radio" name="Gender" <% if rs("Gender")="Others" then %> checked="checked"<%End if%> value="Others"> Others 
    
                    </div>

                    <br>

                    
                    <div class="form-label"> 
                        <label class="col-md-4 control-label" ><b>Select Skills:</b></label>
                        <input type="checkbox" name="Skills" <% if python=1 then %> checked="checked"<%End if%> value="Python">Python
                        <input type="checkbox" name="Skills" <% if php=1 then %> checked="checked"<%End if%> value="PHP">PHP
                        <input type="checkbox" name="Skills" <% if asp=1 then %> checked="checked"<%End if%> value="ASP">ASP
                        <input type="checkbox" name="Skills" <% if react=1 then %> checked="checked"<%End if%> value="React">React <br>
                        <input type="checkbox" name="Skills" <% if js=1 then %> checked="checked"<%End if%> value="Javascript">Javascript
                        <input type="checkbox" name="Skills" <% if vue=1 then %> checked="checked"<%End if%> value="Vue">Vue  
                        <input type="checkbox" name="Skills" <% if angular=1 then %> checked="checked"<%End if%> value="Angular">Angular<br>  
                    </div>
                
                    <br>

                

                    <div class="form-label"> 
                        <label class="col-md-4 control-label" ><b>Portfolio Website: </b> </label>  
                        <input type="url" name="Website" value="<%=rs("Website")%>"><br>  
                    </div>
                    
                    <br>



                    
                    <div>
                        <input type="submit" class="btn btn-success" value="Update">
                    </div>
                </form>
                
            </div>
        </div>
   
    </div>
    <%
    end if
    rs.close
    %>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
</body>
</html>