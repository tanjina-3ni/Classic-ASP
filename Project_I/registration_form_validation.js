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

    
    var s1 = document.getElementById("s1");
    var s2 = document.getElementById("s2");
    var s3 = document.getElementById("s3");
    var s4 = document.getElementById("s4");
    var s5 = document.getElementById("s5");
    var s6 = document.getElementById("s6");
    var s7 = document.getElementById("s7");

    if (s1.checked == false && s2.checked == false && s3.checked == false && s4.checked == false && s5.checked == false && s6.checked == false && s7.checked == false) {
      alert("Select atleast one skill")
      return false;
    }
    
    
  }