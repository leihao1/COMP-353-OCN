<?php 
session_start();
require_once 'security.php';
if(!$_SESSION['logged_in']){
    header("Location: index.php");
}

require_once 'TDG.php'; 

$mytdg = new TDG();
if($mytdg->getUserTypeByID($_SESSION["userID"])!=1){
    header("Location: index.php");
}
?>


<!DOCTYPE html>
<html>
<head>
    		<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
		    <!-- Optional Bootstrap theme -->
		    <link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <meta charset="UTF-8">
    <title> View Inventory Ads</title>

    <style>
        table, th, td {
            border: 1px solid black;
        }
    </style>
</head>
<body>
<div id="site_wrap">
    <!--  Header  -->
    <header id="header" class="main_color">

    </header>

    <!--  Content -->

    <div id="content_wrap">
        <nav id="nav" class="nav_color">
            <h2 id="nav_title">Menu</h2>
            <ul id="nav_list">
                <li><a href="adminHome.php">Home</a></li>
            </ul>
        </nav>

        <article id="content">
            <h2 id="nav_title">View Ads</h2>



        <!-- Insert whatever php file with the content/navigation of the page here -->
        <?php
        
        $mytdg = new TDG();
        $reslist = $mytdg->selectTable("ad");
        $rescolnames = $mytdg->getcolname("ad");
        echo "Ad";
            if (true) {
            // output data of each row
            echo "<table border=\"0\" cellspacing=\"2\" cellpadding=\"2\">"; // start a table tag in the HTML

           // $colnames = mysqli_query($con, $col);
            echo "<tr>";
            for($i=0;$i<sizeof($rescolnames);$i++){
                echo "<td>" . $rescolnames[$i] ."</td>";
            }
            echo "<td>Edit</td>"./*<td>Promote</td>.*/"<td>Delete</td>";
            echo "</tr>";

            
            
            for($i=0;$i<sizeof($reslist);$i++) {//Creates a loop to loop through results
                //echo '<form action="buyPromotion.php" method="post">';
                echo "<tr>";
                for($j=0;$j<sizeof($reslist[$i]);$j++) {
                    if($j == 16 && false){
                        echo "<td>Expired!</td>";
                    }else{
                        echo "<td>" . $reslist[$i][$j] . "</td>";
                    }
                    

                }
                echo '<td>';
                echo '<form action="EditAdd.php" method="post">';
                echo '<input  type="hidden" name="adid" value="'.$reslist[$i][0].'">';
                echo '<input type="submit" name="edit" value="Edit">';
                echo '</form>';
                echo '</td>';
                
                /*echo "<td>";
                echo '<form action="buyPromotion.php" method="post">';
                echo "<input type=\"hidden\" name=\"adid\" value=\"". $reslist[$i][0]."\">";
                echo "<input type=\"submit\" name=\"promote\" value=\"Buy Promotion\"></td>";
                echo "</form>";
                echo "</td>";*/

                echo "<td>";
                echo '<form action="DeleteAdd.php" method="post">';
                echo "<input type=\"hidden\" name=\"adid\" value=\"". $reslist[$i][0]."\">";
                echo "<input type=\"submit\" name=\"delete\" value=\"Delete\"></td>";
                echo "</form>";
                echo "</td>";

                
                echo "</tr>";
            }

        }
        echo "</table>"; //Close the table in HTML
        ?>

        <!--  Footer  -->

        </article>
    </div>
</div>
</body>
</html>
