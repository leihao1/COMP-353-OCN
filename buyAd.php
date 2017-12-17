<?php
session_start();
require_once 'security.php';
if(!$_SESSION['logged_in']){
    header("Location: index.php");
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
    <title>Buy Ad</title>

</head>
<body>
<div id="site_wrap">
    <!--  Header  -->
    <header id="header" class="main_color">
        <h2 id="header_title">Buy Ad </h2>
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
        <?php
            if(!empty($_POST['adid'])){
                $adid = $_POST['adid'];
                $userid = $_SESSION['userID'];
                $mytdg = new TDG();
                if($mytdg->isYourAd($userid,$adid)){
                    echo '<script type="text/javascript">alert("This is your ad, You cannot buy your own Ad!");</script>';
                    echo("<script>
                    window.location.replace('userHome.php')
                     </script>");
                }

            }
        ?>
        <article id="content">


            <form action="" method="post" style="border:1px solid #ccc" >
                <div class="container">

                    <label><b>Select Payment Method</b></label>
                    <br>
                    <select name="paymethod">
                        <option value="credit">Credit Card</option>
                        <option value="debit">Debit Card</option>
                    </select><br><br>

                    <label><b>Rating</b></label>
                    <br>

                    <select name="rating">
                        <option value="5">5</option>
                        <option value="4">4</option>
                        <option value="3">3</option>
                        <option value="2">2</option>
                        <option value="1">1</option>
                    </select><br><br>

                    <label><b>Card Number</b></label><br>
                    <input type="text" placeholder="Enter Credit card number" name="cardnumber" required>


                    <input type="hidden" name="adid" value="<?php echo $_POST['adid']; ?>">

                    <div class="clearfix">
                        <button type="submit" class="submit">Make Payment</button>
                    </div>
                </div>
            </form>

            <?php
            if(!empty($_POST['rating'])){
                $mytdg = new TDG();
                $userid = $_SESSION['userID'];
                $adid = $_POST['adid'];
                $paymethod = $_POST['paymethod'];
                $rating =$_POST['rating'];
                $cardnumber =$_POST['cardnumber'];

                $mytdg->insertTransaction($userid,$adid,$paymethod,$rating,$cardnumber);
                echo("<script>
                    window.location.replace('userHome.php')
                     </script>");
            }



            ?>
        </article>

        <!--  Footer  -->
        <footer id="footer" class="main_color">

        </footer>
    </div>
</div>
</body>
