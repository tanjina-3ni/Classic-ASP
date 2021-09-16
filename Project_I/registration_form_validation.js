function validateForm() {
    let fname = document.forms["Reg"]["firstname"].value;
    if (fname == "") {
      alert("Name must be filled out")
      return false;
    }

    let Email = document.forms["Reg"]["email"].value;
    var atposition = Email.indexOf("@");  
    var dotposition = Email.lastIndexOf(".");  
    if (atposition<1 || dotposition<atposition+2 || dotposition+2>= Email.length){  
        alert("Please enter a valid e-mail address");  
        return false;  
    } 

    let Phone = document.forms["Reg"]["telephone"].value;
    var phoneno = /^\d{11}$/;
    if (Phone.match(phoneno)) 
      Phone=Phone
    else
      {
      alert("Enter valid number");  
      return false;  
      }

    let DoB = document.forms["Reg"]["Birthdate"].value;
    
    if(isNaN(Date.parse(DoB))){
      alert('Enter birth date');
      return false;
    }
    
    let gender = document.forms["Reg"]["gender"].value;
    
    if (gender=="") {
      alert("Select Gender")
      return false;
    }

    
    var python = document.getElementById("python");
    var php = document.getElementById("php");
    var asp = document.getElementById("asp");
    var react = document.getElementById("react");
    var js = document.getElementById("js");
    var vue = document.getElementById("vue");
    var angular = document.getElementById("angular");

    if (python.checked == false && php.checked == false && asp.checked == false && react.checked == false && js.checked == false && vue.checked == false && angular.checked == false) {
      alert("Select atleast one skill")
      return false;
    }
    
    
  }