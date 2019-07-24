<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Login.aspx.vb" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title></title>
        <link rel="stylesheet" type="text/css" href="~/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="~/bootstrap/css/bootstrap-theme.min.css">
        <link rel="stylesheet" type="text/css" href="~/bootstrap/css/custom.css">
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
        <script type="text/javascript" src="~/bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <nav id="myNavbar" class="navbar navbar-default navbar-inverse navbar-fixed-top" role="navigation">

        <!-- Brand and toggle get grouped for better mobile display -->

        <div class="container">

            <div class="navbar-header">

                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Tutorial Republic</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="navbarCollapse">
               <ul class="nav navbar-nav">
                    <li class="active"><a href="http://www.tutorialrepublic.com" target="_blank">Home</a></li>
                    <li><a href="http://www.tutorialrepublic.com/about-us.php" target="_blank">About</a></li>
                    <li><a href="http://www.tutorialrepublic.com/contact-us.php" target="_blank">Contact</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">

        <div class="jumbotron">
            <h1>Learn to Create Websites</h1>
            <p>In today's world internet is the most popular way of connecting with the people. At <a href="http://www.tutorialrepublic.com" target="_blank">tutorialrepublic.com</a> you will learn the essential of web development technologies along with real life practice example, so that you can create your own website to connect with the people around the world.</p>
            <p><a href="http://www.tutorialrepublic.com" target="_blank" class="btn btn-success btn-lg">Get started today</a></p>
        </div>

      
        <hr>
        <div class="row">
            <div class="col-sm-12">
                <footer>
                    <p>&copy; Copyright 2013 Tutorial Republic</p
                </footer>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
