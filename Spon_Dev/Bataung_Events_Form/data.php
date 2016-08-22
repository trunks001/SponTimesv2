<?php
 /* Attempt MySQL server connection. Assuming you are running MySQL

    server with default setting (user 'root' with no password) */

    $link = mysqli_connect("localhost", "bataungb_gcina", "Trunkswilltry001!", "bataungb_attendees");

     

    // Check connection

    if($link === false){

        die("ERROR: Could not connect. " . mysqli_connect_error());

    }

     

    // Escape user inputs for security

    $title = mysqli_real_escape_string($link, $_POST['title']);
    
    $first_name = mysqli_real_escape_string($link, $_POST['firstname']);

    $last_name = mysqli_real_escape_string($link, $_POST['lastname']);

    $email_address = mysqli_real_escape_string($link, $_POST['email']);
    
    $telephone = mysqli_real_escape_string($link, $_POST['telephone']);
    
    $cellphone = mysqli_real_escape_string($link, $_POST['cellphone']);
    
    $fax = mysqli_real_escape_string($link, $_POST['fax']);
    
    $company_name = mysqli_real_escape_string($link, $_POST['companyname']);
    
    $department = mysqli_real_escape_string($link, $_POST['department']);
    
    $designation = mysqli_real_escape_string($link, $_POST['designation']);
    
    $event_date = mysqli_real_escape_string($link, $_POST['eventdate']);
    
    $diet = mysqli_real_escape_string($link, $_POST['diet']);
    
    $allergies = mysqli_real_escape_string($link, $_POST['allergies']);
    
    $response = mysqli_real_escape_string($link, $_POST['submit']);    
     

    // attempt insert query execution

    $sql = "INSERT INTO attendees (title, firstName, lastName, email, telephone, cellphone, fax, companyName, department, designation, eventDate, diet, allergies, response) "
            . "VALUES ('$title', '$first_name', '$last_name', '$email_address', '$telephone', '$cellphone', '$fax', '$company_name', '$department', '$designation', '$event_date', '$diet', '$allergies', '$response')";

    
   
if(mysqli_query($link, $sql)){

       echo "Records added successfully.";
       if ($_POST['submit'] == 'Accept') {
        //action for Accept here
           header("Location: ThankYou.html");
            die();           
        } else if ($_POST['submit'] == 'Decline') {
        //action for Decline
           header("Location: Decline.html");
            die();
        } else {
        //action for Tentative
           header("Location: Tentative.html");
            die();
}

    } else{

     echo "ERROR: Could not able to execute $sql. " . mysqli_error($link);

}

     

    // close connection

    mysqli_close($link);

    
    ?>

