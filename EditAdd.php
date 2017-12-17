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
		<title> Ad Form</title>
	</head>
	<body>
		<div id="site_wrap">

            <nav id="nav" class="nav_color">
                <h2 id="nav_title">Menu</h2>
                <ul id="nav_list">
                    <li class="active_class"><a href="index.php">Login</a></li>
                    <li><a href="userHome.php">Home</a></li>

                </ul>
            </nav>
			<!--  Header  -->
			<header id="header" class="main_color">
                <h2 id="header_title">Required Information Form</h2>
			</header>

			<!--  Content -->
            <?php
            //$category = "";
           // $subcategory = "";
           $id = "";
            if(!empty($_POST["adid"])) {
                //echo "ADDID THING: ".$_POST["adid"];
                $id = $_POST["adid"];
                $mytdg = new TDG();
                $res = $mytdg->getAdById($id);

                

                


            ?>
            <div id="content_wrap">

                <article id="content">
                    <form class="form_section main_color" method="post" action="">
                        <fieldset>

                            <table class="results_table">
                            <input type="hidden" value="<?php echo $id; ?>" name="adid">
                                <tr>
                                    <td>Price</td>
                                    <td><input type="text" value="<?php echo $res["price"]; ?>" name="Price"></td>
                                </tr>
                                <br/>
                                <tr>
                                    <td>Availability</td>
                                    <td><select name="Availability">
                                            <option value="Online" <?php if($res["availability"] == "Online"){echo "selected";} ?>>Online</option>
                                            <option value="Store" <?php if($res["availability"] == "Store"){echo "selected";} ?>>Store</option>
                                        </select>
                                    </td>
                                </tr>
                                <br/>
                                <tr>
                                    <td>Contact Information</td>
                                    <td><input type="text" value="<?php echo $res["contact"]; ?>" name="contact"></td>
                                </tr>
                                <br/>
                                <tr>
                                    <td>ForSaleBy</td>
                                    <td><input type="text"value="<?php echo $res["forsaleby"]; ?>" name="ForSaleBy"></td>
                                </tr>
                                <tr>
                                    <td>AdType</td>
                                    <td><select name="AdType" >
                                            <option value="Sell"<?php if($res["adtype"] == "Sell"){echo "selected";} ?>>Sell</option>
                                            <option value="Buy" <?php if($res["adtype"] == "Buy"){echo "selected";} ?>>Buy</option>
                                        </select>
                                    </td>

                                </tr>
                                <br/>
                                <tr>
                                    <td>Title</td>
                                    <td><input type="text" value="<?php echo $res["title"]; ?>" name="Title"></td>
                                </tr>

                                <tr>
                                    <td>Description</td>
                                    <td><input type="text" value="<?php echo $res["description"]; ?>" name="Description"></td>
                                </tr>
                                <tr>
                                    <td>Image</td>
                                    <td><input type="text" value="<?php echo $res["images"]; ?>" name="image"></td>
                                </tr>
                                <tr>
                                    <td>Address</td>
                                    <td><input type="text" value="<?php echo $res["address"]; ?>" name="address"></td>
                                </tr>
                            <tr>

                            </tr>
                            </table>


                        
                        <input type="submit" name="Submit Ad" value="Edit">
                        </fieldset>
                </article>

                <?php
            }
                if (!empty($_POST['Price'])) {
                    $mytdg = new TDG();
                    $mytdg->TDG();


                    //data from form
                    $Price = $_POST['Price'];
                    $contact = $_POST['contact'];

                    $ForSaleBy = $_POST['ForSaleBy'];
                    //$Category = $_POST['Category'];
                    //$SubCategory = $_POST['SubCategory'];
                    $AdType = $_POST['AdType'];
                    $Title = $_POST['Title'];
                    $image = $_POST['image'];
                    $Description = $_POST['Description'];
                    $availability = $_POST['Availability'];
                    $address = $_POST['address'];

                    //$prov = $mytdg->getUserProvince($userid);
                    //$city = $mytdg->getUserCity($userid);


                    //add into database
                    $id = $_POST["adid"];
                    if($mytdg->updateAdById($id,$contact,$Price,$ForSaleBy,$availability,$Title,$Description,$image,
                    /*$Category,$SubCategory,$prov,$city,*/$AdType,$address))
                        echo "Edit successfull!";
                    
                    
                }

                ?>
    			<!--  Footer  -->
    			<footer id="footer" class="main_color">

    			</footer>
			</div>
		</div>
	</body>
</html>
