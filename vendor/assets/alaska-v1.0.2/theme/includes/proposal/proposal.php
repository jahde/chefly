<?php
// check if fields passed are empty
if(empty($_POST['name'])  		||
   empty($_POST['email']) 		||
   empty($_POST['telephone'])	||
   empty($_POST['type'])	||
   empty($_POST['budget'])	||
   empty($_POST['delivery'])	||
   empty($_POST['outline'])	||
   !filter_var($_POST['email'],FILTER_VALIDATE_EMAIL))
   {
	echo "No arguments Provided!";
	return false;
   }
	
$name = $_POST['name'];
$email_address = $_POST['email'];
$telephone = $_POST['telephone'];
$type = $_POST['type'];
$budget = $_POST['budget'];
$delivery = $_POST['delivery'];
$outline = $_POST['outline'];
	
// create email body and send it	
$to = 'addyouremailaddress@here.com'; // Add the email where you will receive messages sent through the contact form
$email_subject = "Proposal sent by:  $name";
$email_body = "You have received a new project proposal from a client, sent via the proposal form on your wesbite. \n\n".
				  "Their name:\n $name \n \n ".
				  "Email address:\n $email_address \n \n".
				  "Telephone number:\n $telephone \n \n".
				  "Start message:\n \n$type \n ".
				  "Start message:\n \n$budget \n ".
				  "Start message:\n \n$delivery \n ".
				  "Start message:\n \n$outline \n ".
$headers = "From: $email_address\n";
$headers .= "Reply-To: $email_address";	
mail($to,$email_subject,$email_body,$headers);
return true;			
?>