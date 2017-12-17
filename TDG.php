<?php



class TDG
{
    private $host;
    private $dbname;
    private $user;
    private $password;


    function __construct()
    {
        $this->host = "mysql4.gear.host";
        $this->dbname = "comp353";
        $this->user = "comp353";
        $this->password = "Pq77_sa-i833";

    }

    //call this function after making a TDG object it will set the database credentials
    public function TDG(){


        /*$this->host = "mysql4.gear.host";
        $this->dbname = "comp353";
        $this->user = "comp353";
        $this->password = "Pq77_sa-i833";*/

    }

    //returns a connection variable
    public function connect(){

        $con = mysqli_connect($this->host,$this->user,$this->password,$this->dbname);

        //check is connection was successful
        if(mysqli_errno($con)){
            echo "Failed to Connect ".mysqli_connect_error();
            return false;
        }else{
            return $con;
        }
    }


    // return true if the email is being used
    public function email_used($email){
        $con = $this->connect();
        $used = $con->query("SELECT email FROM user WHERE email = '".$email."';");
        if (mysqli_num_rows($used)== 0) {// rows == 0 means that the email is not in the database and can be used
            $con->close();
            return false; // return false because it is not being used
        }
        else{
            $con->close();
            return true;//return true, yes it is being used
        }
    }

    // inserts a user in the dtabase
    public function insert_user($Email,$FirstName,$LastName,$Pass,$prov,$city){
        $con = $this->connect();
        $admin =0;

        $sql='INSERT INTO user VALUES (null,"'.$Email.'","'.$FirstName.'","'.$LastName.'",'.$admin.',"'.$Pass.'","'.$prov.'","'.$city.'")';
        if ($con->query($sql)) {
            echo "<br>New User created successfully";
            $con->close();
            return true;
        }else{
            $con->close();
            echo "<br>New User creation Failed!";

            return false;
        }

    }


    // returns 2D array of the table[row][column]
    public function selectTable($table){
        $con = $this->connect();
        $result= mysqli_query($con,"SELECT * FROM ".$table);
        $array = array();

        while($row = mysqli_fetch_array($result,MYSQLI_NUM)) {
            $array[] = $row;
        }

        $con->close();
        return $array;
    }

    public function selectTableCondition($table,$a,$b){
        $con = $this->connect();
        $result= mysqli_query($con,"SELECT * FROM ".$table." WHERE ".$a." = ".$b );
        $array = array();
        while($row = mysqli_fetch_array($result,MYSQLI_NUM)) {
            $array[] = $row;
        }
        $con->close();
        return $array;
    }

    //returns an array of the collumn names array[0]=[col0]...
    public function getcolname($table){
        $con = $this->connect();
        $sql="";
        if($table == "SubCategory"){
            $sql = 'SHOW COLUMNS FROM SubCategory';
        }else
         {
             $sql = 'SHOW COLUMNS FROM '.$table;
          }

        $colnames = mysqli_query($con, $sql);

        $res = [];
        while ($row = mysqli_fetch_array($colnames)) {
            $res[] =  $row['Field'];

        }
        $con->close();
        return $res;
    }

    public function countRows($table){
        $con = $this->connect();
        $sql = "SELECT * FROM .$table";
        $result = mysqli_query($con,$sql);
        return mysqli_num_rows($result);
    }

    public function getAdById($id){
        $con = $this->connect();
        $sql = "SELECT * FROM ad WHERE AdID = ".$id;
        $result = mysqli_query($con,$sql);
        $row = mysqli_fetch_array($result,MYSQLI_ASSOC);
        return $row;
    }

    public function updateAdById($id,$contact,$Price,$ForSaleBy,$availability,$Title,$Description,$image,
    /*$Category,$SubCategory,$prov,$city,*/$adtype,$address){
        $con = $this->connect();
        $sql = 'UPDATE ad SET contact = "'.$contact.'", price = '.$Price.', forsaleby = "'.$ForSaleBy.'", availability = "'.$availability.'", title = "'.$Title.'", description = "'.$Description.'", '.
        ' images = "'.$image./*', category = '.$Category.', subcategory = '.$SubCategory.', province = '.$prov.', city = '.$city.*/'", adtype = "'.$adtype.'", address = "'.$address.'" WHERE AdID = '.$id.';';
        //echo 'SQL: '.$sql.'<br>';
        if(mysqli_query($con, $sql)){
            
            $con->close();
            return true;
        }else{
            echo"update AD FAILED!";
            echo mysqli_error($con);
            $con->close();
            return false;
        }
    }
    public function deleteAdById($id){
        $con = $this->connect();
        $sql = 'DELETE FROM ad WHERE AdID = '.$id.';';
        //echo 'SQL: '.$sql.'<br>';
        if(mysqli_query($con, $sql)){

            $con->close();
            return true;
        }else{
            echo"delete AD FAILED!";
            echo mysqli_error($con);
            $con->close();
            return false;
        }
    }

    //SELECT `ad`.`AdID`,
/*    `ad`.`contact`,
    `ad`.`price`,
    `ad`.`forsaleby`,
    `ad`.`availability`,
    `ad`.`title`,
    `ad`.`description`,
    `ad`.`images`,
    `ad`.`category`,
    `ad`.`subcategory`,
    `ad`.`userID`,
    `ad`.`postDate`,
    `ad`.`province`,
    `ad`.`city`,
    `ad`.`storeName`,
    `ad`.`adtype`
FROM `comp353`.`ad`;
*/
    // takes an email as argument and returns the userid if the email exists
    public function getUserByEmail($email){
        $con = $this->connect();
        $sql = 'SELECT userID FROM user WHERE Email = "'.$email.'"';
        $result = mysqli_query($con, $sql);
        $id = mysqli_fetch_assoc($result)["userID"];
        $con->close();
        return $id;
    }

    //returns true if the email and password match
    public function makeLogin($email, $password){
        $con = $this->connect();
        $sql = 'SELECT Email, password FROM user WHERE Email = "'.$email.'" AND password = "'.$password.'"';
        $result = mysqli_query($con, $sql);
        $res = false;
        if (mysqli_num_rows($result) == 1) {
            $res = true;
        }
        $con->close();
        return $res;
    }

    // returns the int value of the user type, returns 0 if user, returns 1 if admin
    public function getUserTypeByID($id){
        $con = $this->connect();
        $sql = 'SELECT user_type FROM user WHERE userID = '.$id;
        $result = mysqli_query($con, $sql);
        $usertype = mysqli_fetch_assoc($result)["user_type"];

        $con->close();
        return $usertype;
    }

    //return true if the user has selected a province and city
    public function checkUserProvinceCity($id){
        $con = $this->connect();
        $sql = 'SELECT province, city FROM user WHERE userID = '.$id;
        $result = mysqli_query($con, $sql);
        $result = mysqli_fetch_assoc($result);
        $res = false;
        $prov= $result["province"];
        $city = $result["city"];
        if ($prov != null && $city != null) {
           // echo "<br>user has already selected province and city";
            $res = true;
            return $res;
        }else {
            echo "<br>user has NOT selected province and city";
            $con->close();
            return $res;
        }

    }

    public function backupTables(){
        $con = $this->connect();
        $sql = "CALL `backupAllPayments`();";
        if(mysqli_query($con, $sql)){
            $con->close();
            return true;
        }else{
            $con->close();
            return false;
        }
    }

    public function selectProvinceCity($prov,$city,$id){
        $con = $this->connect();
        $sql = 'UPDATE user SET province = "'.$prov.'" , city = "'.$city.'" WHERE userID = '.$id;
        if(mysqli_query($con, $sql)){
            $con->close();
            echo "<br>updated province and city";
            return true;
        }else{
        $con->close();
            echo "<br>Province and city FAILED!";
        return false;
        }
    }
    public function getUserProvince($id){
        $con = $this->connect();
        $sql = 'SELECT province FROM user WHERE userID = '.$id;
        $result = mysqli_query($con, $sql);
        $prov = mysqli_fetch_assoc($result)["province"];

        $con->close();
        return $prov;
    }
    public function getUserCity($id){
        $con = $this->connect();
        $sql = 'SELECT city FROM user WHERE userID = '.$id;
        $result = mysqli_query($con, $sql);
        $city = mysqli_fetch_assoc($result)["city"];

        $con->close();
        return $city;
    }
    public function insertAd($contact,$Price,$ForSaleBy,$availability,$Title,$Description,$image,
                             $Category,$SubCategory,$userid,$postdate,$prov,$city,$adtype, $address){
        $con = $this->connect();

        $sql='INSERT INTO Ad VALUES (null,"'.$contact.'",'.$Price.',"'.$ForSaleBy.'","'.$availability.'","'.$Title.'","'.$Description.'","'.$image.
            '","'.$Category.'","'.$SubCategory.'",'.$userid.',"'.$postdate.'","'.$prov.'","'.$city.'",null,"'.$adtype.'","'.$address.'")';
        //echo "SQL: ".$sql;
        if(mysqli_query($con, $sql)){
            echo "ad inserted successfully";
            $con->close();
            return true;
        }else{
            echo"insert AD FAILED!";
            echo mysqli_error($con);
            $con->close();
            return false;
        }

    }
    public function makeMembershipPayment($userid,$plan,$cardnumber,$amount,$dateofpayment){
        $con = $this->connect();

        $sql='INSERT INTO MembershipPayment VALUES ("'.$userid.'","'.$plan.'",'.$cardnumber.','.$amount.',"'.$dateofpayment.'")';
        if(mysqli_query($con, $sql)){

            echo "payment successful";
            $con->close();
            return true;
        }else{
            echo"Payment FAILED!";
            echo mysqli_error($con);
            $con->close();
            return false;
        }


    }

    //return true if the user has a membership of any kind
    public function checkMembership($userid){
        $con = $this->connect();

        $sql='SELECT amount FROM MembershipPayment WHERE userID = '.$userid;
        $result = mysqli_query($con, $sql);
        $result = mysqli_fetch_assoc($result);
        if($result["amount"] > 0){
            $con->close();
            return true;
        }else{
           // echo '<script type="text/javascript">alert("You do not have Membership, you cannot post ads without a membership!");</script>';
            $con->close();
            return false;
        }

    }

    public function insertPromotionPayment($userid,$adid,$promodays,$cardnumber,$amount,$dateofpayment){
        $con = $this->connect();

        $sql='INSERT INTO PromotionPayment VALUES ("'.$userid.'","'.$adid.'",'.$promodays.','.$cardnumber.','.$amount.',"'.$dateofpayment.'")';
        if(mysqli_query($con, $sql)){
            echo "payment successful";
            $con->close();
            return true;
        }else{
            echo"Payment FAILED!";
            echo mysqli_error($con);
            $con->close();
            return false;
        }

    }

    //return true if the ad has already been promoted
    public function checkPromotion($userid,$adid){
        $con = $this->connect();

        $sql='SELECT promoDays,DateofPayment FROM PromotionPayment WHERE AdID = '.$adid;
        $result = mysqli_query($con, $sql);
        echo mysqli_error($con);
        $result = mysqli_fetch_array($result);
        $promo = $result['promoDays'];//$result['DateofPayment']
        //echo $promo."<br>";
        $datepaid = strtotime($result['DateofPayment']);
        //echo $datepaid."<br>";
        $today = strtotime(date("Y-m-d"));
        //echo $today."<br>";
        $interval = strtotime("+".$promo."day",$datepaid);
       // echo $interval."<br>";

        if($promo == null && $datepaid == null){
            $con->close();
            return false;
        }else if($interval  < $today ){// if the promotion has expired
            $con->close();
            return false;
         }else{
            echo '<script type="text/javascript">alert("You already promoted this ad!");</script>';
            $con->close();
            return true;
        }

    }

    public function rankAds($category,$subcategory,$prov,$city){
        $con = $this->connect();

    $sql = "    
    select ad.*,membershippayment.plan,promotionpayment.promodays as promotion 
      from ad
	    left outer join membershippayment
		  on ad.userID = membershippayment.userID
	    left outer join membership
		  on membershippayment.plan = membership.plan
	    left outer join promotionpayment
		  on ad.adID = promotionpayment.adID
      where ((datediff( current_date() ,ad.postdate)) <= membership.visibledays
        or (datediff( current_date() ,promotionpayment.dateofpayment)) <= promotionpayment.promodays)
        and category = "."'$category'"." and subcategory = "."'$subcategory'"." and province = "."'$prov'"." and city = "."'$city'"."
      order  by  promotion desc,postDate desc;";

        $result= mysqli_query($con,$sql);
        if(!$result){echo mysqli_error($con);}
        $array = array();

        while($row = mysqli_fetch_array($result,MYSQLI_NUM)) {
            $array[] = $row;
        }

        $con->close();
        return $array;

    }

    // return true if the ad you are trying to buy is your own
    public function isYourAd($userid,$adid){
        $con = $this->connect();

        $sql = 'select * from ad where userid = "'.$userid.'"and adid = "'.$adid.'";';
        $result= mysqli_query($con,$sql);
        if(!empty($result)) {
            if (mysqli_num_rows($result) == 1) {
                $con->close();
                return true;
            } else {
                $con->close();
                return false;
            }
        }else{
            echo mysqli_error($con);
            $con->close();
            return true;
        }
    }

    public function getPurchaseType($adid){
        $con = $this->connect();
        $sql = 'select adtype from ad where adid = '.$adid;
        $result= mysqli_query($con,$sql);
        if(!empty($result)) {
                $con->close();
            $adtype = mysqli_fetch_assoc($result)["adtype"];
                return $adtype;


        }else{
            echo mysqli_error($con);
            $con->close();
            return false;
        }
    }
    public function getAmount($adid){
        $con = $this->connect();
        $sql = 'select price from ad where adid = '.$adid;
        $result= mysqli_query($con,$sql);
        if(!empty($result)) {
            $con->close();
            $price = mysqli_fetch_assoc($result)["price"];
            return $price;
        }else{
            echo mysqli_error($con);
            $con->close();
            return false;
        }
    }
    public function insertTransaction($userid,$adid,$paymethod,$rating,$cardnumber){
        $con = $this->connect();

        $dateofpayment = date("y-m-d");
        $purchasetype = $this->getPurchaseType($adid);
        $amount = $this->getAmount($adid);
        $sql='INSERT INTO transaction VALUES (null,"'.$dateofpayment.'","'.$paymethod.'",'.$cardnumber.',"'.$purchasetype.'",'.$rating.','.$amount.','.$userid.','.$adid.')';
        if(mysqli_query($con, $sql)){
            echo "payment successful";
            $con->close();
            return true;
        }else{
            echo"Payment FAILED!";
            echo mysqli_error($con);
            $con->close();
            return false;
        }


    }

}
