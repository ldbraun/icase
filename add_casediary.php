<?php
require_once("config.php");

if(isset($_POST['crCaseBtn'])) {
    $crno = $_POST['crno'];
    $team = $_POST['team'];
    $casedate = $_POST['casedate'];
    $casetitle = $_POST['casetitle'];
    $offences  = $_POST['offences'];
    $natureofoffence = $_POST['noo'];
    $itemsrecovered = $_POST['itemsrec'];
    $sendcaseto = $_POST['sendcaseto'];
    $caseofficer = $_POST['caseoffr'];
    $caselocation = $_POST['caseloc'];
    $visible = $_POST['visible'];
    $archive = $_POST['archive'];
    $casestate = $_POST['case_state'];
    
    $create_query = "INSERT INTO tbl_casediary(crno, team, casedate, casetitle, offences, nature_of_offence, items_recovered, send_case_to, invest_offr, case_location, case_state, visible, archive) VALUES ('$crno', '$team', '$casedate', '$casetitle', '$offences', '$natureofoffence', '$itemsrecovered', '$sendcaseto', '$caseofficer', '$caselocation', '$casestate', '$visible', '$archive')";
    $create_result = mysqli_query($conn, $create_query) or die(mysqli_connect_error());
    
    if($create_result) {
        header("Location: casediary_details.php?ra=create&rt=casediary&rs=1&a=viewdetails&t=casediary&id={$crno}");
    } else {
        header("Location: casediary.php?a=create&t=casediary&s=0");
    }
}

?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>iCase : Case Diary</title>
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
                     <h2>Case Diary</h2>
                        <h5></h5>
                    </div>
                </div>
                
                <hr />
                
                <div class="row">
                    <div class="col-md-8">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3>
                                    Create New Casediary
                                    <span class="pull-right">
                                        <a href="javascript:history.back(1)" onclick="return confirm('You are about to cancel this operation')" class="btn btn-primary">Cancel</a>
                                    </span>
                                </h3>
                            </div>
                            
                            <div class="panel-body">
                                <form role="form" class="form-horizontal" method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="crno" class="col-sm-12">Case Registration No.</label>
                                                <div class="col-sm-12">
                                                    <input type="text" placeholder="CRNO" name="crno" class="form-control" required />
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="team" class="col-sm-12">Team</label>
                                                <div class="col-sm-12">
                                                    <input type="text" placeholder="Team" name="team" class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="casedate" class="col-sm-12">Case Date</label>
                                                <div class="col-sm-12">
                                                    <input type="text" placeholder="Case Date" name="casedate" class="form-control idate" required />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="casetitle" class="col-sm-12">Case Title</label>
                                        <div class="col-sm-12">
                                            <input type="text" class="form-control" name="casetitle" placeholder="Case Title" required>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="offences" class="col-sm-12">Offences</label>
                                        <div class="col-sm-12">
                                            <textarea class="form-control" name="offences" rows="4" placeholder="Offences"></textarea>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="noo" class="col-sm-12">Nature of Offence</label>
                                        <div class="col-sm-12">
                                            <textarea class="form-control" name="noo" rows="4" placeholder="Nature of Offence"></textarea>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="itemsrec" class="col-sm-12">Items Recovered</label>
                                        <div class="col-sm-12">
                                            <textarea class="form-control" name="itemsrec" rows="4" placeholder="Items Recovered"></textarea>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="sendcaseto" class="col-sm-12">Send Case To</label>
                                                <div class="col-sm-12">
                                                    <select name="sendcaseto" class="form-control">
                                                        <option>Send Case To</option>
                                                        <option value="MoJ">Ministry of Justice</option>
                                                        <option value="Magistrate">Magistrate</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="caseoffr" class="col-sm-12">Case Officer</label>
                                                <div class="col-sm-12">
                                                    <input type="text" placeholder="Case Officer" name="caseoffr" class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="caseloc" class="col-sm-12">Case Location</label>
                                                <div class="col-sm-12">
                                                    <input type="text" placeholder="Case Location" name="caseloc" class="form-control" required />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="case_state" class="col-sm-12">Case State</label>
                                        <div class="col-sm-6">
                                            <input type="text" name="case_state" class="form-control" placeholder="Case State">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="visible" class="col-sm-12">Visible</label>
                                        <div class="col-sm-5">
                                            <select name="visible" class="form-control">
                                                <option>Visible</option>
                                                <option value="1">Yes</option>
                                                <option value="0">No</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="archive" class="col-sm-12">Archive</label>
                                        <div class="col-sm-5">
                                            <select name="archive" class="form-control">
                                                <option>Archive</option>
                                                <option value="1">Yes</option>
                                                <option value="0">No</option>
                                            </select>
                                        </div>
                                    </div>
                                    
                            </div>
                            
                            <div class="panel-footer">
                                <div class="form-group text-right">
                                    <a href="javascript:history.back(1)" class="btn btn-primary" onclick="return confirm('You are about to cancel this operation?')">Cancel</a>
                                    <button type="submit" class="btn btn-success" name="crCaseBtn">Save</button>
                                </div>
                            </div>
                            </form>
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
