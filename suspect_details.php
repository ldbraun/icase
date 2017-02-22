<?php
require_once("config.php");

//if((isset($_GET['a'])) && ($_GET['a'] == "viewdetails") && (isset($_GET['t'])) && ($_GET['t'] == "casediary") && (isset($_GET['id']))) {
    
    $field = $_GET['id'];
    
    //Get Suspects
    $susp_query = "SELECT * FROM tbl_suspects WHERE susp_id='$field'";
    $susp_result = mysqli_query($conn, $susp_query) or die(mysqli_connect_error());
    
    $suspect = mysqli_fetch_assoc($susp_result);
    $suspect_count = mysqli_num_rows($susp_result);
    
//} else {
//    header("Location: casediary.php?a=wrong_link");
//}

?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>iCase : Suspects</title>
	<?php include("includes/head.phtml"); ?>
</head>
<body>
    <div id="wrapper">
        <?php include("includes/header.phtml"); ?> 
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-md-12">
                     <h2>Suspect Details</h2>
                        <h5></h5>
                    </div>
                </div>
                
                <hr />
                
                <div class="row">
                    <div class="col-md-5">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3>
                                    Suspect Profile
                                    <span class="pull-right">
                                        <a href="add_suspect.php" class="btn btn-primary">Add Suspect</a>&nbsp;
                                        <a href="suspects.php" class="btn btn-primary">List All Suspect</a>
                                    </span>
                                </h3>
                            </div>
                            
                            <div class="panel-body form-horizontal">
                                
                                <div class="form-group">
                                    <label class="col-sm-4">Sex</label>
                                    <div class="col-sm-5">
                                        <?php echo $suspect['susp_sex']; ?>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-4">Date of Birth</label>
                                    <div class="col-sm-5">
                                        <?php echo $suspect['susp_dob']; ?>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-4">Age</label>
                                    <div class="col-sm-5">
                                        <?php echo $suspect['susp_age']; ?>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-4">Marital Status</label>
                                    <div class="col-sm-5">
                                        <?php echo $suspect['susp_mstatus']; ?>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-4">Tribe</label>
                                    <div class="col-sm-5">
                                        <?php echo $suspect['susp_tribe']; ?>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-4">State</label>
                                    <div class="col-sm-5">
                                        <?php echo $suspect['susp_state']; ?>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-4">LGA</label>
                                    <div class="col-sm-5">
                                        <?php echo $suspect['susp_lga']; ?>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-4">Address</label>
                                    <div class="col-sm-5">
                                        <?php echo $suspect['susp_addr']; ?>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-4">Occupation</label>
                                    <div class="col-sm-5">
                                        <?php echo $suspect['susp_occp']; ?>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-4">Date Registered</label>
                                    <div class="col-sm-5">
                                        <?php echo $suspect['susp_datereg']; ?>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-4">Nickname</label>
                                    <div class="col-sm-5">
                                        <?php echo $suspect['susp_nickname']; ?>
                                    </div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-4">Bank Account</label>
                                    <div class="col-sm-5">
                                        <?php echo $suspect['susp_bank_accts']; ?>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                        
                    <div class="col-md-3">
                        <div class="well">
                            <div class="text-center">
                                <img src="uploads/suspects/<?php echo $suspect['susp_photo']; ?>" class="img-responsive">
                            </div>
                            <h3 class="text-center">
                                <?php echo $suspect['susp_name']; ?>
                                <small class="help-block"><?php echo $suspect['susp_nickname']; ?></small>
                            </h3>
                        </div>
                    </div>
                    
                </div>
                 <!-- /. ROW  -->
               
    </div>
             <!-- /. PAGE INNER  -->
            </div>
         <!-- /. PAGE WRAPPER  -->
        </div>
     <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <?php include("includes/scripts.phtml"); ?>
    
   
</body>
</html>
