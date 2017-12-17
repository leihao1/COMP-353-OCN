<?php

session_start();
require_once 'security.php';
if(!($_SESSION['logged_in'])){
    echo("<script>
                    window.location.replace('index.php')
                     </script>");
}

require_once 'TDG.php';

?>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<!-- Optional Bootstrap theme -->
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
    <meta charset="UTF-8">
    <title>Catalog</title>

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
        <h2 id="header_title">Catalog </h2>
    </header>

    <!--  Content -->
    <!-- Insert whatever php file with the content/navigation of the page here -->
    <div id="content_wrap">
        <nav id="nav" class="nav_color">
            <h2 id="nav_title">Menu</h2>
            <ul id="nav_list">
                <li class="active_class"><a href="index.php">Login</a></li>
                <li><a href="userHome.php">Home</a></li>
            </ul>
        </nav>

        <h2 id="nav_title">Select Category to Browse</h2>
        <form action="Catalog.php" method="post">
            <select name="Categories" >
                <?php
                $mytdg = new TDG();

                $tablename = "SubCategory";
                $result = array();
                $result = $mytdg->selectTable($tablename);
                $lengthrow = count($result);
                //loop through array and print each [row][column]
                for ($i = 0; $i < $lengthrow; $i++) {
                    $string = $result[$i][0]. "," . $result[$i][1];
                    //$string[1] = $result[$i][1];
                    echo "<option value='$string'>" . $result[$i][0] . "-" . $result[$i][1] . "</option>";

                }

                ?>

            </select>
            <input type="submit" value="View Ads" />
        </form>


        <article id="content">
            <?php
            $mytdg = new TDG();

            if(!empty($_POST["Categories"])) {
                $string = $_POST['Categories'];
                $pieces = explode(",", $string);
                $category = $pieces[0];
                $subcategory = $pieces[1];

                echo $category;
                echo "<br>";
                echo $subcategory;
                echo "<br>";

                $rescolnames = $mytdg->getcolname("ad");
                $prov = $mytdg->getUserProvince($_SESSION['userID']);
                $city = $mytdg->getUserCity($_SESSION['userID']);
                $reslist = $mytdg->rankAds($category, $subcategory,$prov,$city);

                echo "<table border=\"0\" cellspacing=\"2\" cellpadding=\"2\">"; // start a table tag in the HTML
                // $colnames = mysqli_query($con, $col);
                echo "<tr>";
                for ($i = 0; $i < sizeof($rescolnames); $i++) {
                    echo "<td>" . $rescolnames[$i] . "</td>";
                }
                echo "<td>Membership Plan</td>";
                echo "<td>Promotion</td>";
                echo "<td>Buy</td>";
                echo "</tr>";

                for($i=0;$i<sizeof($reslist);$i++) {//Creates a loop to loop through results
                    echo '<form action="buyAd.php" method="post">';
                    echo "<tr>";
                    for($j=0;$j<sizeof($reslist[$i])-1;$j++){
                        if($j == 10){
                            echo "<td><a href=\"viewOtherUserAdds.php?userid=".$reslist[$i][$j]."\">".$reslist[$i][$j]."</a></td>";
                        }else{
                            echo "<td>".$reslist[$i][$j]."</td>";
                        }
                        
                    }
                    $prom = $reslist[$i][sizeof($reslist[$i])-1];
                    if($prom == 7 || $prom == 30 || $prom == 60){
                        echo "<td>Promoted</td>";
                    }else{
                        echo "<td></td>";
                    }

                    echo "<input type=\"hidden\" name=\"adid\" value=\"". $reslist[$i][0]."\">";
                    echo "<td>";
                    echo '<input type="submit" value="Buy">';
                    echo "</td>";
                    echo "</tr>";
                   echo" </form> ";
            }
            echo "</table>"; //Close the table in HTML

            }
            ?>
        </article>

        <!--  Footer  -->
        <footer id="footer" class="main_color">

        </footer>
    </div>
</div>
</body>
</html>
