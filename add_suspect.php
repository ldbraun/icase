<?php
session_start();
require_once("config.php");

if(isset($_GET['case'])) {
    $crno = $_GET['case'];
}

$get_crnos = mysqli_query($conn, "SELECT * FROM tbl_casediary") or die(mysqli_connect_error());

$state_query = "SELECT * FROM tbl_states";
$state_result = mysqli_query($conn, $state_query) or die(mysqli_connect_error());

if(isset($_POST['addSuspBtn'])) {
    $case = $_POST['crno'];
    $name = $_POST['name'];
    $sex = $_POST['sex'];
    $marital_status = $_POST['mstatus'];
    $dob = $_POST['dob'];
    $cal_dob = explode("-", $dob);
    $age = date('Y') - $cal_dob[0];
    $tribe = $_POST['tribe'];
    $lga = $_POST['lga'];
    $state = $_POST['state'];
    $address = $_POST['address'];
    $photo = $_FILES['susphoto']['name'];
    $occupation = $_POST['occupation'];
    $nickname = $_POST['nickname'];
    $account_number = $_POST['acct_number'];
    $remark = $_POST['remark'];
    
//    if(isset($photo)) {
//        move_uploaded_file($_FILES['susphoto']['tmp_name'], "uploads/suspects/".$_FILES['susphoto']['name']);
//    }
    
    
    $create_query = "INSERT INTO tbl_suspects(crno, susp_name, susp_sex, susp_dob, susp_age, susp_mstatus, susp_tribe, susp_state, susp_lga, susp_addr, susp_photo, susp_occp, susp_nickname, susp_bank_accts, susp_remarks ) VALUES ('$case', '$name', '$sex', '$dob', '$age', '$marital_status', '$tribe', '$state', '$lga', '$address', '$photo', '$occupation', '$nickname', '$account_number', '$remark')";
    
    $create_result = mysqli_query($conn, $create_query) or die(mysqli_connect_error());
    
    $suspect_id = mysqli_insert_id($conn);
        $_SESSION['suspname'] = $name;
    $_SESSION['dp'] = $photo;
    
    if($create_result) {
        copy($_FILES['susphoto']['tmp_name'], "uploads/suspects/".$photo);
        header("Location: arrest.php?ra=create&rt=suspect&s=1&a=arrest&susp={$suspect_id}");
    } else {
        header("Location: add_suspect.php?a=create&t=suspect&s=0");
    }
}

?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>iCase : Add Suspect</title>
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
                     <h2>Suspects</h2>
                        <h5>Add New Suspect</h5>
                    </div>
                </div>
                
                <hr />
                
                <div class="row">
                    <div class="col-md-8">
                        <form role="form" class="form-horizontal" method="post" enctype="multipart/form-data" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h3>
                                        CRNO
                                        
                                        <?php if(isset($_GET['case'])) { ?>
                                        <span>
                                            <input type="text" style="border: 1px gray solid" readonly value="<?php echo $_GET['case']; ?>" name="crno">
                                        </span>
                                        <?php } else { ?>
                                        <span>
                                            <input list="crno" id="crnos" name="crno" placeholder="Enter Case Title here">
                                            <span id="errMsg"></span>
                                        </span>

                                        <datalist id="crno">
                                            <?php while($crnos = mysqli_fetch_assoc($get_crnos)) { ?>
                                            <option value="<?php echo $crnos['crno']; ?>"><?php echo $crnos['casetitle']; ?></option>
                                            <?php } ?>
                                        </datalist>
                                        <?php } ?>
                                        
                                        <span class="pull-right">
                                            <a href="javascript:history.back(1);" onclick="return confirm('You are about to cancel this operation?');" role="button" class="btn btn-primary">Cancel</a>
                                        </span>
                                    </h3>
                                </div>

                                <div class="panel-body <?php if(!isset($_GET['case'])) { echo "suspanel"; } ?>">
                                    
                                        <div class="form-group">
                                            <label for="crno" class="control-label col-sm-2">Suspect Name</label>
                                            <div class="col-sm-10">
                                                <input type="text" placeholder="Suspect Name" name="name" class="form-control" required />
                                            </div>
                                        </div>
                                        
                                            <input type="hidden" name="crno" value="<?php echo $crno; ?>">
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Sex</label>
                                            <div class="col-md-3">
                                                <select name="sex" class="form-control">
                                                    <option value="Male">Male</option>
                                                    <option value="Female">Female</option>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Marital Status</label>
                                            <div class="col-md-5">
                                                <select name="mstatus" class="form-control">
                                                    <option value="Signle">Single</option>
                                                    <option value="Married">Married</option>
                                                    <option value="Divorced">Divorced</option>
                                                    <option value="Widow">Widow</option>
                                                    <option value="Widower">Widower</option>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Date of birth</label>
                                            <div class="col-md-4">
                                                <div class="input-group">
                                                    <input type="date" name="dob" id="dob" data-date-format="yyyy-mm-dd" class="form-control" placeholder="Date of birth">
                                                    <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="state" class="control-label col-md-2">State</label>
                                            <div class="col-md-8">
                                                <select name="state" id="txtstate" class="form-control">
                                                    <option>Select</option>
                                                    <?php foreach($state_result as $state) { ?>
                                                    <option value="<?php echo $state['state']; ?>"><?php echo $state['state']; ?></option>
                                                    <?php } ?>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="lga" class="control-label col-md-4">Local Government</label>
                                                    <div class="col-md-8">
                                                        <select name="lga" id="sellga" class="form-control">
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label for="tribe" class="control-label col-md-3">Tribe</label>
                                                    <div class="col-md-9">
                                                        <input type="text" placeholder="Tribe" name="tribe" class="form-control" required />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="address" class="control-label col-md-2">Address</label>
                                            <div class="col-md-10">
                                                <textarea placeholder="Address" name="address" class="form-control"></textarea>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="susphoto" class="control-label col-md-2">Photo</label>
                                            <div class="col-md-8">
                                                <input type="file" name="susphoto">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="occupation" class="control-label col-md-2">Occupation</label>
                                            <div class="col-md-8">
                                                <input type="text" name="occupation" placeholder="Occupation" class="form-control">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label for="nickname" class="control-label col-md-2">Nickname</label>
                                            <div class="col-md-6">
                                                <input type="text" class="form-control" name="nickname" placeholder="Nickname">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Bank Details</label>
                                            <div class="col-md-8">
                                                <input type="text" class="form-control" placeholder="Bank Name, Account Number" name="acct_number">
                                            </div>
                                        </div>
                                        
                                        <div class="form-group">
                                            <label class="control-label col-md-2">Remarks</label>
                                            <div class="col-md-10">
                                                <textarea rows="3" class="form-control" placeholder="Suspect Remark" name="remark"></textarea>
                                            </div>
                                        </div>
                                        
                                </div>
                                </div>
                                
                                <div class="panel-footer <?php if(!isset($_GET['case'])) { echo "suspanel"; } ?>">
                                    <div class="form-group text-right">
                                        <button type="submit" class="col-sm-offset-6 btn btn-success" name="addSuspBtn">Save</button>
                                    </div>
                                </div>
                                </form>
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
