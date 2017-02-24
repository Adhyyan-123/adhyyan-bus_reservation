<html>
 <head> 
 <title>Add New Record in MySQL Database Table</title>
 </head>
 <body>
 <?php
extract( $_POST );
if(isset($_POST['add']))
{ 
$servername="localhost";
$username="root";
$password="cluster";
$conn=mysqli_connect($servername, $username, $password);
if(!$conn)
	die("Connection Failed".mysqli_error($conn));
mysqli_select_db($conn,'online_bus');
$id=$_POST["userid"];
$block=$_POST["name"];
$pass=$_POST["pass"];
$sql = "INSERT INTO users ".  
      "(u_id,username,password) ". 
	  "VALUES ".   
	  "('$id','$block','$pass')"; 
$retval = mysqli_query($conn,$sql);
if(!$retval)
	{
	echo "the name already exists\n" ;  
	echo "please try other name\n";
	die("could not enter data \n".mysqli_error($conn));
	}
else
	echo "Entered data successfully\n";
mysqli_close($conn);
}
else
{
?>
<form method="post" action="<?php $_PHP_SELF ?>">
 <center>
 <table width="600" border="0" cellspacing="1" cellpadding="2"> 
 
 <tr> 
 <td width="250">userid</td>
 <td>
 <div class="col-sm-10">
 <input name="userid" class="form-control" type="text" id="userid" placeholder="Enter userid">
 </div
 </td>
 </tr>

 
 <tr> 
 <td width="250">username</td>
 <td>
 <div class="col-sm-10">
 <input name="name" class="form-control" type="text" id="name" placeholder="Enter username"> 
 </div>
 </td>
 </tr>

<tr> 
 <td width="250">password</td>
 <td>
 <div class="col-sm-10">
 <input name="pass" class="form-control" type="password" id="pass" placeholder="Enter password">
 </div>
 </td>
 </tr>


 <td width="250">
 </td>
 <td>

 <input name="add" type="submit" id="add" value="Add"> 
 </td>
 </tr>

 </table>
 </center>
 </form>
 <?php
 } 
 ?>
 </body>
 </html> 