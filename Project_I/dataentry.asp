<%
    ' server side validation
    fname = Request.Form("firstname")
    lname = Request.Form("lastname")
    email = Request.Form("email")
    phone = Request.Form("telephone")
    DOB = Request.Form("Birthdate")
    gender = Request.Form("gender")
    web = Request.Form("website")
    skills = Request.Form("skills")

    msg = ""
    if fname="" Then
        msg = msg + "Enter Name<br>"
    end if

    set regEx = New RegExp
    regEx.Pattern = "^[-+.\w]{1,64}@[-.\w]{1,64}\.[-.\w]{2,6}$"
    isValidE = regEx.Test(email)
    if isValidE="False" Then
        msg = msg + "Enter a valid e-mail address<br>"
    end if

    set rgEx = New RegExp
    rgEx.Pattern = "\b[0-9]{11}\b"
    isValidP = rgEx.Test(phone)
    if isValidP="False" Then
        msg = msg + "Enter valid number<br>"
    end if
    

    if IsDate(DOB)="False" Then
        msg = msg + "Enter birth date<br>"
    end if

    if gender="" Then
        msg = msg + "Select Gender<br>"
    end if

    if skills="" Then
        msg = msg + "Select atleast one skill<br>"
    end if

    if msg<>"" Then 
        response.write(msg)
        response.end
    end if


    ' connect to the database
    set conn=Server.CreateObject("ADODB.Connection")
    conn.Provider="Microsoft.Jet.OLEDB.4.0"
    conn.Open "C:\inetpub\wwwroot\Project_I\Employee.mdb"

    's = Request.Form("s")
    'v = Split(Request.Form("s"),", ")

    'response.write(s)
    'response.write(TypeName(v))
    'response.end()

    set rs=Server.CreateObject("ADODB.recordset")
    rs.Open "SELECT MAX(ID) as id FROM signup", conn 'WHERE Email='" & Request.Form("Email") & "'", conn
    
    id=rs("ID")
    rs.close
    

    sql="INSERT INTO EMP (ID,Fname,Lname,"
    sql=sql & "Email,Phone,DOB,Gender,Website)"
    sql=sql & " VALUES "
    sql=sql & "('" & id & "',"
    sql=sql & "'" & fname & "',"
    sql=sql & "'" & lname & "',"
    sql=sql & "'" & email & "',"
    sql=sql & "'" & phone & "',"
    sql=sql & "'" & DOB & "',"
    sql=sql & "'" & gender & "',"
    sql=sql & "'" & web & "')"
    'sql=sql & "'" & Request.Form("resume") & "')"
    on error resume next
    conn.Execute sql,recaffected


    

    'response.write(s)
    'response.end()
    skills = Split(skills,", ")
    for each skill in skills
        sql1="INSERT INTO skills (Skills,Emp_ID)"
        sql1=sql1 & " VALUES "
        sql1=sql1 & "('" & skill & "',"
        sql1=sql1 & "" & id & ")"
        on error resume next
        conn.Execute sql1,recaffected
    next

    
    'response.write sql1
    'response.end()

    
    if err<>0 then
        Response.Write("No update permissions!")
    else
        Response.Redirect "index.asp"
        
    end if
    conn.close
%>
