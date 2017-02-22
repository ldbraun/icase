<?php
session_start();

require_once("config.php");

if(isset($_POST['arrestBtn'])) {
    $susp_id = $_POST['suspid'];
    $arrest_date = $_POST['arrest_date'];
    $arrest_time = $_POST['arrest_time'];
    $arrest_story  = $_POST['arrest_story'];
    $ipo = $_POST['ipo'];
    $arrest_state = $_POST['arrest_state'];
    $arrest_loc = $_POST['arrest_loc'];
    $team = $_POST['team'];
    $arrest_remark = $_POST['arrest_remark'];
    
    $create_query = "INSERT INTO tbl_arrests(susp_id, arrest_date, arrest_story, ipo, arr_location, arr_state, team, remarks, arr_time) VALUES ('$susp_id', '$arrest_date', '$arrest_story', '$ipo', '$arrest_loc', '$arrest_state', '$team', '$arrest_remark', '$arrest_time')";
    $create_result = mysqli_query($conn, $create_query) or die(mysqli_connect_error());
    
    if($create_result) {
        header("Location: casediary_details.php?ra=create&rt=arrest&rs=1&id={$crno}");
    } else {
        header("Location: arrest.php?a=create&t=arrest&s=0");
    }
}

?>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>iCase : Arrest</title>
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
                     <h2>Arrests</h2>
                        <h5></h5>
                    </div>
                </div>
                
                <br />
                
                <div class="row">
                    <div class="col-md-8">
                        <div class="media success">
                          <div class="media-left">
                            <a href="#">
                              <img class="media-object img-responsive" style="height:80px;" src="uploads/suspects/<?php echo $_SESSION['dp']; ?>" alt="SUspect">
                            </a>
                          </div>
                          <div class="media-body">
                            <h4 class="media-heading"><?php echo $_SESSION['suspname']; ?></h4>
                            Saved successfully! <strong>Now enter arrest details</strong>
                          </div>
                        </div>
                    </div>
                </div>
                
                <hr />
                
                <div class="row">
                    <div class="col-md-8">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3>
                                    Make Arrest
                                    <span class="pull-right">
                                        <a href="javascript:history.back(1)" onclick="return confirm('You are about to cancel this operation')" class="btn btn-primary">Cancel</a>
                                    </span>
                                </h3>
                            </div>
                            
                            <div class="panel-body">
                                <form role="form" class="form-horizontal" method="post" action="<?php echo $_SERVER['PHP_SELF']; ?>">
                                    
<!--                                    <input type="hidden" name="crno" value="<?php //echo $_GET['case']; ?>">-->
                                    <input type="hidden" name="suspid" value="<?php echo $_GET['susp']; ?>">
                                    
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="arrest_date" class="col-sm-12">Arrest Date</label>
                                                <div class="col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-calendar"></i></span>
                                                        <input type="date" placeholder="YYYY-MM-DD" id="dob" data-date-format="yyyy-mm-dd" name="arrest_date" class="form-control" required />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="time" class="col-sm-12">Arrest Time</label>
                                                <div class="col-sm-12">
                                                    <div class="input-group">
                                                        <span class="input-group-addon"><i class="fa fa-clock-o"></i></span>
                                                        <input type="text" placeholder="HH:MM:SS" name="arrest_time" class="time form-control" data-date="" data-date-format="hh:ii" data-link-field="dtp_input3" data-link-format="hh:ii" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="arrest_story" class="col-sm-12">Arrest Story</label>
                                        <div class="col-sm-12">
                                            <textarea rows="5" name="arrest_story" placeholder="Arrest Story" class="form-control"></textarea>
                                        </div>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="ipo" class="col-sm-12">IPO</label>
                                                <div class="col-sm-12">
                                                    <input type="text" class="form-control" name="ipo" placeholder="IPO">
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="arrest_state" class="col-sm-12">Arrest State</label>
                                                <div class="col-sm-12">
                                                    <input type="text" placeholder="Arrest State" name="arrest_state" class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                        
                                        <div class="col-sm-4">
                                            <div class="form-group">
                                                <label for="arrest_loc" class="col-sm-12">Arrest Location</label>
                                                <div class="col-sm-12">
                                                    <input type="text" placeholder="Arrest Location" name="arrest_loc" class="form-control" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="team" class="col-sm-12">Team</label>
                                        <div class="col-sm-6">
                                            <input type="text" name="team" class="form-control" placeholder="Team">
                                        </div>
                                    </div>
                                    
                                    <div class="form-group">
                                        <label for="arrest_remark" class="col-sm-12">Arrest Remark</label>
                                        <div class="col-sm-12">
                                            <textarea rows="5" name="arrest_remark" placeholder="Arrest Remark" class="form-control"></textarea>
                                        </div>
                                    </div>
                                    
                            </div>
                            
                            <div class="panel-footer">
                                <div class="form-group text-right">
                                    <a href="javascript:history.back(1)" class="btn btn-primary" onclick="return confirm('You are about to cancel this operation?')">Cancel</a>
                                    <button type="submit" class="btn btn-success" name="arrestBtn">Save</button>
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
