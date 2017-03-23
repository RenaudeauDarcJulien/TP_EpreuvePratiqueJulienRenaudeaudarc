<?php
error_reporting(0);
require "init.php";
 
$identifiant = $_GET["identifiant"];
$motdepasse = $_GET["motdepasse"];
$email = $_GET["email"];
$nom = $_GET["nom"];
$prenom = $_GET["prenom"];
$poste = $_GET["poste"];
 
 
$sql = "INSERT INTO `utilisateur` (`id`,`nom`, `prenom`, `email`,`identifiant`, `motdepasse`, `poste`) VALUES (NULL, '".$nom."', '".$prenom."', '".$email."', '".$identifiant."', '".$motdepasse."', NULL);";
if(!mysqli_query($con, $sql)){
    echo '{"message":"Unable to save the data to the database."}';
}
 
?>