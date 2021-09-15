<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        /* Style the navigation bar */
        .navbar {
        width: 100%;
        background-color:RGB(1, 88, 88);
        overflow: auto;
        color: white;
        }
        .part1 {
            width:40%;
            height: 50%;
            float: left;
            padding: 1px;
        }
        .part2 {
            width:42%;
            height: 50%;
            float: right;
            padding: 1px;
        }
        .content{
        width: 100%;
        position: relative;
        }

        .button {
        background-color: rgba(206, 255, 253, 0.966);
        color: black;
        border: 2px solid #08a799;
        }

        
    </style>
</head>
<body>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <nav class="navbar">
        <div class="content" id="search">
            <form name="searchForm" method="POST" id="formID" action="search_test.asp">
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

    
        
        


</body>
</html>