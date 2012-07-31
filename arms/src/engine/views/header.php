<?php
/**
 * Core Template File (header)
 * 
 * 
 * @author Minh Duc Nguyen <minh.nguyen@ands.org.au>
 * @see ands/
 * @package ands/
 * 
 */
?>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title><?php echo $title;?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Twitter Bootstrap Styles -->
    <link href="<?php echo base_url();?>assets/lib/twitter_bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="<?php echo base_url();?>assets/lib/twitter_bootstrap/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- ANDS Less file and general styling correction-->
    <link href="<?php echo base_url();?>assets/css/base.css" rel="stylesheet">
    <link href="<?php echo base_url();?>assets/less/arms.less" rel="stylesheet/less" type="text/css">

    <!-- Libraries Styles-->
    <link rel="stylesheet" href="<?php echo base_url();?>assets/lib/chosen/chosen.css">
    <link rel="stylesheet" href="<?php echo base_url();?>assets/lib/bootstrap_toggle_button/jquery.toggle.buttons.css">

    

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- The fav and touch icons -->
    <!--link rel="shortcut icon" href="ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png"-->
  </head>

<body>

<div class="container-fluid" id="topbar">
    <div class="row-fluid">
      <div class="span12" style="text-align:right;" id="logged_in_user">
        <i class="icon-user"></i> Logged in as: Minh Duc Nguyen (u4297901) <a href="javascript:;">Logout</a>
      </div>
    </div>
</div>
<div class="container-fluid" id="banner">
    <div class="row-fluid page-header">
      <div class="span5"><h1>ARMS <br/><small>ANDS Registry Management System</small></h1></div>
      <div class="span7">
        <div id="show_responsive"><button class="btn show_nav" data-toggle="button">Show Menu</button></div>
        <ul class="nav nav-pills pilnav" id="main-nav">
          <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">My Records <b class="caret"></b></a>
            <ul class="dropdown-menu sub-menu">
              <li class=""><a href="#">Manage My Records</a></li>
              <li class=""><a href="#">Add My Records</a></li>
              <li class=""><a href="#">Publish My Records</a></li>
            </ul>
          </li>
          <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">My Datasources <b class="caret"></b></a>
            <ul class="dropdown-menu sub-menu">
              <li class=""><a href="#">Manage My Datasources</a></li>
              <li class=""><a href="#">Datasources Tools</a></li>
            </ul>
          </li>
          <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">My Identifiers <b class="caret"></b></a>
            <ul class="dropdown-menu sub-menu">
              <li class=""><a href="#">DOI</a></li>
              <li class=""><a href="#">PID</a></li>
            </ul>
          </li>
        </ul>
      </div>
    </div>
</div>