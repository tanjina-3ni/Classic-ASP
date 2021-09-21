<!DOCTYPE html>
<head>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
    
    <nav class="navbar">
        <div class="dropdown">
            <button class="dropbtn"><i class="fa fa-bars" aria-hidden="true"></i></button>
            <div class="dropdown-content">
            <a href="#">Update Password</a>
            <a href="signOut.asp" onclick="return signOut()">Sign Out</a>
            </div>
          </div>
        
        <div class="content" id="search">
            <form name="searchForm" method="POST" id="formID">
                <div class='part1'>
                    <label><strong>Name:</strong></label>  
                    &nbsp;
                    <input type="text" name="search" placeholder="Name">
                </div>
            
                <div class='part2'>
                    <label><strong>Date:</strong></label>  
                    &nbsp;
                    <input type="date" id="fromperiod" name="from" placeholder="dd-mm-yyyy">
                    <label for="toperiod">to</label>
                    <input type="date" id="toperiod" name="to" placeholder="dd-mm-yyyy">
                </div>
                
            
                <br>
                <br>
            
                <div class='part1'>
                    <label><strong>Gender:</strong></label>  
                    &nbsp;
                    <input type="radio" name="gender" value="Male"> Male   
                    <input type="radio" name="gender" value="Female"> Female 
                    <input type="radio" name="gender" value="Others"> Others 
                </div>
                
                <div class='part2'>
                    <label><strong>Skills:</strong></label>  
                    &nbsp;
                    <input type="checkbox" name="Python" value="Python">Python
                    <input type="checkbox" name="PHP" value="PHP">PHP
                    <input type="checkbox" name="ASP" value="ASP">ASP
                    <input type="checkbox" name="Vue" value="Vue">Vue 
                    <input type="checkbox" name="Javascript" value="Javascript">Javascript 
                    <input type="checkbox" name="React" value="React">React
                    <input type="checkbox" name="Angular" value="Angular">Angular
                    &nbsp;
                
                    <button type="submit" class="button" id="searchButton">Search</button>
                </div> 
            </form>
        </div>
            
    </nav>

    <script>
    function signOut() {
        alert("Signed out")
    }
    </script>
</body>
</html>