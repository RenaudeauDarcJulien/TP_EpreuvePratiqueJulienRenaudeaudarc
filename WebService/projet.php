<?php
error_reporting(0);
require "init.php";
 
$id = $_GET["id"];

$sql = "SELECT projet.ID_PROJET, projet.NOM, projet.DATE_FIN,projet.BUDGET FROM projet, utilisateur, appartient WHERE projet.ID_PROJET = appartient.ID_PROJET AND appartient.ID_UTILISATEUR = ".$id."";
$result = mysqli_query($con, $sql);

while($row = mysqli_fetch_all($result)){
	$response = array("id_projet"=>$row[0],"nom"=>$row[1],"date_fin"=>$row[2],"budget"=>$row[3]);

}	var_dump($response);
echo json_encode(array("user_project"=>$response));

?>

