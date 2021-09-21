<!DOCTYPE html>
<html lang="en">
<head>
    <title>Registration</title>

    <link rel="stylesheet" href="style.css">

    <script type="text/javascript" src="registration_form_validation.js"></script> 

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    
</head>
<body>
    <div class="form_wrapper">
        <div class="myDiv">
            
            <div class="title_container">
                <h2>Other Info</h2> 
            </div><br>
            <div class="mb-3 row">
                <form name="Reg" method="post" action="dataentry.asp" onsubmit="return validateForm()">
                    
                    <div class="form-label">  
                        <label class="col-md-4 control-label" ><strong>First name:</strong></label>  
                        <input type="text" name="firstname" placeholder="First Name"> <br>
                    </div>

                    <br>

                    <div class="form-label">
                        <label class="col-md-4 control-label" ><strong>Last name:</strong></label>  
                        <input type="text" name="lastname" placeholder="Last Name"><br> 
                    
                    </div>

                    <br>

                    <div class="form-label"> 
                        <label class="col-md-4 control-label" ><b>Email-address:</b></label> 
                        <input type="text" name="email" placeholder="Example@gmail.com">      
                    </div>
                    <br>

                    <div class="form-label">
                        <label class="col-md-4 control-label" ><b>Mobile Number:</b></label> 
                        <input type="text" name="telephone" placeholder="01*********">  
                    </div>  
                
                    <br>

                
                    <div class="form-label"> 
                        <label class="col-md-4 control-label" ><b>Date of Birth:</b></label>
                        <input type="text" name="Birthdate" placeholder="mm-dd-yyyy"><br>
                    </div>


                    <br>
                    <div class="form-label">
                
                        <label class="col-md-4 control-label" ><strong>Gender:</strong></label>
                        <input type="radio" name="gender" value="Male"> Male   
                        <input type="radio" name="gender" value="Female"> Female 
                        <input type="radio" name="gender" value="Others"> Others 
                    </div>

                    <br>
                
                    <div class="form-label"> 
                        <label class="col-md-4 control-label" ><b>Select Skills:</b></label>
                        <input type="checkbox" id="python" name="skills" value="Python">Python
                        <input type="checkbox" id="php" name="skills" value="PHP">PHP
                        <input type="checkbox" id="asp" name="skills" value="ASP">ASP
                        <input type="checkbox" id="react" name="skills" value="React">React
                        <input type="checkbox" id="js" name="skills" value="Javascript">Javascript <br>
                        <input type="checkbox" id="vue" name="skills" value="Vue">Vue  
                        <input type="checkbox" id="angular" name="skills" value="Angular">Angular<br>  
                    </div>
                    
                    <br>

                

                    <div class="form-label"> 
                        <label class="col-md-4 control-label" ><b>Portfolio Website: </b> </label>  
                        <input type="url" name="website" placeholder="http://example.com"><br>  
                    </div>
                    
                    <br>



                    <!--<div class="form-label"> 
                        <label class="col-md-4 control-label" ><strong>Upload Resume:</strong></label>
                        <input type="file" name="resume">
                    </div>-->

                    <br>

                    <div>
                        <input type="submit" class="btn btn-success" value="Submit">
                    </div>
                </form>
                
            </div>
        </div>
   
    </div>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
</body>
</html>