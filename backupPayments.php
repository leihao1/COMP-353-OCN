<?php

session_start();
require_once 'security.php';
if(!$_SESSION['logged_in']){
    header("Location: index.php");
}
require_once 'TDG.php';


    $mytdg = new TDG();
    if($mytdg->backupTables())
    {
        echo "Tables have been backed up!";
    }else{
        echo "Error backing up tables!";
    }



?>