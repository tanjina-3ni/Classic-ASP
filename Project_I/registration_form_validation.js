function validateForm() {
    msg = ""
    let fname = document.forms["Reg"]["firstname"].value;
    if (fname == "") {
      msg = msg + "Enter Name\n";
    }

    let Email = document.forms["Reg"]["email"].value;
    var atposition = Email.indexOf("@");  
    var dotposition = Email.lastIndexOf(".");  
    if (atposition<1 || dotposition<atposition+2 || dotposition+2>= Email.length){  
      msg = msg + "Enter a valid e-mail address\n";    
    } 

    let Phone = document.forms["Reg"]["telephone"].value;
    var phoneno = /^\d{11}$/;
    if (Phone.match(phoneno)) 
      Phone=Phone
    else
      {
      msg = msg + "Enter valid number\n";   
      }

    let DoB = document.forms["Reg"]["Birthdate"].value;
    
    if(isNaN(Date.parse(DoB))){
      msg = msg + "Enter birth date\n";
    }
    
    let gender = document.forms["Reg"]["gender"].value;
    
    if (gender=="") {
      msg = msg + "Select Gender\n";
    }

    
    var python = document.getElementById("python");
    var php = document.getElementById("php");
    var asp = document.getElementById("asp");
    var react = document.getElementById("react");
    var js = document.getElementById("js");
    var vue = document.getElementById("vue");
    var angular = document.getElementById("angular");

    if (python.checked == false && php.checked == false && asp.checked == false && react.checked == false && js.checked == false && vue.checked == false && angular.checked == false) {
      msg = msg + "Select atleast one skill";
    }
    
    if (msg!="") {
      alert(msg);
      return false;
    }
    
  }