<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
    <link rel="stylesheet" href="./index.css">
    <title>Website bán hàng lớp cntt1_21</title>
    <script src="js/jquery-3.2.1.min.js"></script>
    <script src="js/jquery-3.2.1.js"></script>
    <script>
        $(function() {
            $('#slider li').hide().filter(':first').show();
            setInterval(slideshow, 2000);
        });

        function slideshow() {
            $('#slider li:first').fadeOut('slow').next().fadeIn('slow').end().appendTo('#slider');
        }
    </script>
</head>
<?php 
	session_start() ;
	// include ("./conet/ketnoicsdl.php");
?>
<body>
    <div class="container bg-light">
        <div class="banner">
            <ul id="slider">
                <li>
                    <img src="img/banner.jpg" width="100%" height="150px" />
                </li>
                <li>
                    <img src="img/1b.jpg" width="100%" height="150px" />
                </li>
                <li>
                    <img src="img/banner1.jpg" width="100%" height="150px" />
                </li>
            </ul>
        </div>
        <div class="row bg-info">
            <div class="top">
                <ul class="menu_top">
                    <li><a href="./index.php">Trang chủ</a></li>
                    <?php
                        include 'menu_loaisp.php';
                        if (isset($_SESSION["cart"]) && $_SESSION["cart"] != null) {
                            $count = count($_SESSION["cart"]);
                        } else {
                            $count = 0;
                        }
                    ?>
                    <p style="line-height:45px;text-align:right; margin-right: 10px;">
				    <a href="index.php?loaisp=view_cart" style="text-decoration:none; color: red; font-weight:bold">Giỏ hàng có <?php echo $count; ?> sản phẩm</a></p>
                </ul>
            </div>
        </div>
        <!-- khu vực chứa sp -->
        <div class="row">
            <div class="col-lg-2 col-md-6 col-sm-12 bg-primary">
                <ul class="menu_left">
                    <?php
                         include 'hangsx.php';
                    ?>
                </ul>
            </div>
            <div class="col-8">
                <div class="row">
                    <!-- sản phẩm thứ nhất -->
                    <?php                        
                        if (isset($_GET['action']))
							{ $action = $_GET['action'];}
							else $action = "";
							if (isset($_GET['loaisp'])) {
								switch ($_GET['loaisp']) {
									case 'loai':
										{
											include('./laysptheoloai.php');
											break;
										}
									case 'hang':
										{
											//include('laysptheoloai.php');
											break;
										}
                                    // case 'add':{
                                    //     include('./Quantri/giohang/dathang.php');
                                    //     break;
                                    // }  
                                    case 'view_cart':{
                                        include('./Quantri/giohang/view_card.php');
                                        break;
                                    }
                                    case 'thanhtoan':{
                                        include('./Quantri/giohang/thanhtoan.php');
                                        break;
                                    }
                                    case 'insert':{
                                        include('./Quantri/giohang/insert_card.php');
                                        break;
                                    }	
									default;
										break;
								}							
							}else{               
								include 'laysp.php';
							}                           
                            if (isset($_GET['action'])) 
                            {    $action = $_GET['action'];}
                            else $action="";
                            if (isset($_GET['giohang'])) {
                                switch ($_GET['giohang']) {
                                    // case 'chitiet':
                                    // {
                                    //     include('chitietsp.php');
                                    //     break;
                                    // }
                                    case 'add':{
                                        include('./Quantri/giohang/dathang.php');
                                        break;
                                    }  
                                    case 'delete':{
                                        include('./Quantri/giohang/dathang.php');
                                        break;
                                    }  
                                    case 'update':{
                                        include('./Quantri/giohang/dathang.php');
                                        break;
                                    }
                                    
                                    // case 'view_cart':{
                                    //     include('./Quantri/giohang/view_card.php');
                                    //     break;
                                    // }
                                    default;
									break;
                                }
                            }
                    // include('./laysp.php');
                    ?>
                </div>
            </div>
            <div class="col-lg-2 col-md-6 col-sm-12">
                <div class="row">
                    <div class="right_1">
                        <p style="text-align:center; background:#48dbfb; color:#F00; font-weight:bold; font-size:18px;">Đăng nhập</p>
                        <div>
                            <form action="" method="post">
                            <?php if (isset($_SESSION['username'])) {?>
                                <p style="text-align: center; font-weight: bold;color: red">Xin chào: <span> <?php echo $_SESSION['username'] ?> </span></p>
                                <p style="text-align: center; font-weight: bold; color: blue"><a href="./Quantri/logout.php">Thoát</a></p>
                            <?php } else {?>
                                <input type="text" name="user" style=" height:20px; width:155px; ">
                                <input type="password" name="pass" style=" height:20px; width:155px"><br>
                                <input type="submit" name="login" value="Đăng nhập" style="width: 160px; height: 25px;">                            
                                <p style="text-align: center; font-weight: italic"><a href="index.php?content=dangky">Đăng ký</a></p>
                                <?php 
                                    include ('./connet.php');
                                    include './quantri/xulylogin.php';
                                ?>
                            <?php } ?>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row bg-success"><p>footer</p> </div>
        
    </div>
</body>
</html>