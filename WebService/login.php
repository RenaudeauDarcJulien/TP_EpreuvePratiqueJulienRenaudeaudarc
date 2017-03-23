<?php
error_reporting(0);
require "init.php";
 
$identifiant = $_GET["identifiant"];
$motdepasse = $_GET["motdepasse"];

$sql = "SELECT * FROM `utilisateur` WHERE `identifiant`='".$identifiant."' AND `motdepasse`='".$motdepasse."';";
$result = mysqli_query($con, $sql);

while($row = mysqli_fetch_array($result)){
	$response = array("id_utilisateur"=>$row[0],"nom"=>$row[1],"prenom"=>$row[2],"email"=>$row[3],"identifiant"=>$row[4],"motdepasse"=>$row[5],"poste"=>$row[6]);
}
echo json_encode(array("user_data"=>$response));
?>