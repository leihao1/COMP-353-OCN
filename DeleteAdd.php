<?php

session_start();
require_once 'security.php';
if(!$_SESSION['logged_in']){
    header("Location: index.php");
}
require_once 'TDG.php';

if(!empty($_POST["adid"])) {
    //echo "ADDID THING: ".$_POST["adid"];
    $id = $_POST["adid"];
    $mytdg = new TDG();
    if($mytdg->deleteAdById($id))
    {
        echo "Ad deleted!";
    }else{
        echo "Error deleteing ad!";
    }
}else{
    echo "No ad found!";
}


?>